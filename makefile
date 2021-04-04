include .env
export $(shell sed 's/=.*//' .env)

release-major:
	pytest && \
	python bump_version.py --major && \
	git pull origin master && \
	git push origin dev && \
	git push --tags origin master && \
	python setup.py sdist bdist_wheel && \
	twine upload dist/*

release-minor:
	pytest && \
	python bump_version.py --minor && \
	git pull origin master && \
	git push origin dev && \
	git push --tags origin master && \
	python setup.py sdist bdist_wheel && \
	twine upload dist/*

release-patch:
	pytest && \
	python bump_version.py --patch && \
	git pull origin master && \
	git push origin dev && \
	git push --tags origin master && \
	python setup.py sdist bdist_wheel && \
	twine upload dist/*