from flask import Flask

app = Flask(__name__)


@app.route('/')
def domov():
	return"raz tu mozno bude aj htmlko";

   
@app.route('/knihy')
def funkcia1(): 
	from load_knih import load_knih   
	funkcia1 = load_knih
	return funkcia1()



if __name__ == "__main__":
    app.run(debug=True)
    app.run(use_reloader=True)

