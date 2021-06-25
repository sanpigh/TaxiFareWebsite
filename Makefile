
APP_NAME='taxifarewebsitesan'
HEROKU_EMAIL_ADDRESS=

run_streamlit:
	streamlit run app.py

# config:
# 	${HEROKU_EMAIL_ADDRESS}

deploy:
	# create the app in the EU region
	heroku create ${APP_NAME} --region eu
# you should see the origin remote for GitHub
# and the heroku remote for Heroku
	git remote -v
# manually add the heroku remote if necessary
	git remote add heroku https://git.heroku.com/${taxifarewebsitesan}.git
# deploy the app
	git push heroku master
# start the web dyno
	heroku ps:scale web=1
# check the logs for errors
check_heroku_logs:
	heroku logs --tail