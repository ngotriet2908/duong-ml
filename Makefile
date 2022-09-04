.ONESHELL:

CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate
CONDA_DEACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda deactivate
CONDA_RM=source $$(conda info --base)/etc/profile.d/conda.sh ; conda env remove -n

setup:
	conda create -n duong-ml python=3.8.13 -y; $(CONDA_ACTIVATE) duong-ml;	conda install pytorch torchvision -c pytorch -y; 	pip install -e .

run:
	$(CONDA_ACTIVATE) duong-ml; python main.py --debug=True

clean:
	find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
	rm -rf */duong_ml.egg-info
	rm -rf .idea

remove:
	$(CONDA_DEACTIVATE); $(CONDA_RM) duong-ml
	rm -rf output
