
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello, World!, This is a new change. I hope it works. This seems right. CI/CD pipeline is very interesting on how it works, trying to see if it works"

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=8000)
