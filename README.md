conda create -n duong-ml python=3.8.13

conda activate duong-ml

conda install pytorch torchvision cudatoolkit -c pytorch

pip install -e .

python main.py