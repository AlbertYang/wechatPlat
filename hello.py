from flask import Flask, request, make_response
app = Flask(__name__)

@app.route('/')
def index():
    return "Hello World!"

@app.route('/auth',methods=['GET','POST'])
def wechat_auth():
    if request.method == 'GET':
        print 'coming Get'
        data = request.args
        token = "4yN275N7g3cY7t2znnG7U7h4MbU7wT42"
        signature = data.get('signature','')
        timestamp = data.get('timestamp','')
        nonce = data.get('nonce','')
        echostr = data.get('echostr','')
        s = [timestamp,nonce,token]
        s.sort()
        s = ''.join(s)
        if (hashlib.sha1(s).hexdigest() == signature):
            return make_response(echostr)

if __name__ == "__main__":
    app.run(host='127.0.0.1', port=8080)
