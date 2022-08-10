import gradio as gr
import os
import shutil
from detect import run as detect
from pathlib import PurePosixPath

os.environ['AIO_NUM_THREADS']='64'
os.environ['OMP_NUM_THREADS']='64'

w='yolov5n-frozen-640.torchscript'

#img_examples = '/workspace/yolo-demo/data/images/'
img_examples = ['examples/bus.jpg', 'examples/horses.jpg', 'examples/zidane.jpg']
vid_examples = ['examples/video-small-640.mp4']
vid_yt_examples = ['https://www.youtube.com/watch?v=cgm5nEdnuhE']
p = 'Please select a URL from Examples or Enter one'

def yolo_image(inp):
	#print(f'yolo-image: type(inp): {type(inp)}')
	#print(f'yolo-image: inp: {inp.name}')
	proj_dir = 'out-blocks-image'
	out = f'{proj_dir}/{PurePosixPath(inp.name).name}'
	#print(f'yolo-image: out: {out}')
	os.makedirs(proj_dir, exist_ok=True)
	shutil.rmtree(proj_dir)
	detect(source=inp.name, weights=w, project=proj_dir,
	       name='', exist_ok=True)
	return out

def yolo_video(inp):
	#print(f'yolo-image: type(inp): {type(inp)}')
	proj_dir = 'out-blocks-video'
	out = f'{proj_dir}/{PurePosixPath(inp).name}'
	out_h264 = f'{proj_dir}/output.mp4'
	#print(f'display-video: inp: {inp} out: {out} out_h264: {out_h264}')
	os.makedirs(proj_dir, exist_ok=True)
	shutil.rmtree(proj_dir)
	detect(source=inp, weights=w, project=proj_dir, name='', exist_ok=True)
	os.system(f'ffmpeg -y -i {out} -vcodec libx264 -acodec aac {out_h264} -loglevel warning')
	#os.remove(out)
	return out_h264

def yolo_video_live(inp):
	#print(f'yolo-image: type(inp): {type(inp)}')
	#print(f'display-video: inp: {inp} out: {out} out_h264: {out_h264}')
	proj_dir = 'out-blocks-video-live'
	os.makedirs(proj_dir, exist_ok=True)
	detect(source=inp, weights=w, project=proj_dir, name='', exist_ok=True)

def yolo_webcam_live(inp):
	#print(f'yolo-image: type(inp): {type(inp)}')
	#print(f'display-video: inp: {inp} out: {out} out_h264: {out_h264}')
	proj_dir = 'out-blocks-webcam-live'
	out = f'{proj_dir}/{PurePosixPath(inp.name).name}'
	os.makedirs(proj_dir, exist_ok=True)
	shutil.rmtree(proj_dir)
	detect(source=inp.name, weights=w, project=proj_dir, name='', exist_ok=True)
	return out

#demo = gr.Interface(fn=video_render, inputs=gr.component('video'), outputs=gr.component('video'))
demo = gr.Blocks(title='Yolov5 demo')
with demo:
	gr.Markdown('# Yolov5 demo')
	gr.Markdown('')
	gr.Markdown('## Running on Ampere AltraMax!')
	gr.Markdown('')
	with gr.Tabs():
		with gr.TabItem('Image'):
			with gr.Row():
				img_input = gr.Image(type='file', label='input')
				img_output = gr.Image(type='file', label='output')
			img_button = gr.Button('Submit')
			examples = gr.Examples(fn=yolo_image, inputs=img_input, outputs=img_output, examples=img_examples)
		with gr.TabItem('Video'):
			with gr.Row():
				vid_input = gr.Video(type='file', label='input')
				vid_output = gr.Video(type='file', label='output')
			vid_button = gr.Button('Submit')
			examples = gr.Examples(fn=yolo_video, inputs=vid_input, outputs=vid_output, examples=vid_examples)
		with gr.TabItem('Video - YouTube'):
			with gr.Row():
				yt_input = gr.Textbox(label='input', placeholder=p)
				yt_output = gr.Video(label='output')
			yt_button = gr.Button('Submit')
			examples = gr.Examples(fn=yolo_video_live, inputs=yt_input, outputs=yt_output, examples=vid_yt_examples)
		with gr.TabItem('Webcam'):
			with gr.Row():
				wc_input = gr.Image(type='file', source='webcam', streaming=True, label='input')
				wc_output = gr.Image(label='output')
			wc_button = gr.Button('Submit')

	img_button.click(yolo_image, inputs=img_input, outputs=img_output)
	vid_button.click(yolo_video, inputs=vid_input, outputs=vid_output)
	yt_button.click(yolo_video_live, inputs=yt_input, outputs=yt_output)
	wc_button.click(yolo_webcam_live, inputs=wc_input, outputs=wc_output)

	gr.Markdown('### Add AltraMax expanded description')

demo.launch(share=True, debug=True)
