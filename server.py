import tensorflow as tf
import predict
from flask import Flask, request

tf_config = tf.ConfigProto(gpu_options=tf.GPUOptions(visible_device_list='0'))
sess = tf.Session(config=tf_config)
predictor = predict.EasyPredictor(sess)

app = Flask(__name__)


@app.route('/talk')
def hello():
    q = request.args.get('q') or ''
    return predictor.predict(q)[0]
