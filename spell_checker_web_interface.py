from flask import render_template

from flask import request

from flask import url_for

from markupsafe import escape

from flask import Flask

import autocorrect
from autocorrect import Speller

spanish_spelling_checker = Speller('es')

app = Flask(
    __name__
    )


@app.route(
	'/spanish_spell_checker',
	methods = [
		'POST',
		'GET',
		])

def spanish_spell_checker():
	if request.method == 'POST':
		input_text = request.form['input_text']

		try:
			corrected_text = spanish_spelling_checker(input_text)
		except:
			corrected_text = ''

		return render_template(
			"spanish_spell_checker.html",
			corrected_text = corrected_text,
			input_text = input_text,
			)
	else:
		return render_template(
			"spanish_spell_checker.html")


'''

# start the service

flask --app spell_checker_web_interface --debug run --port=7791

# user the service 

http://127.0.0.1:5000/spanish_spell_checker

'''