# LineVD

# Requirements

- [Python 3.7](../python3.7)
- [graphviz](../graphviz)
- [expat[(../expat)
 
# Scripts

| Script | purpose | note |
| --- | --- | --- |
| linevd.sh | Setup linevd with a venv and install dependencies | I had some issues with the dependencies. The environment which worked for me is in the requirements.txt file |
| linevd_init.sh | Download all required files to storage/external dir | |
| linevd_feature_extraction.sh | Run prepare.py and getgraphs.py | This did not run on the cluster. I had to run this locally and copy over the files from storage/cache |
| linevd_train_best.sh | Train the model | |
| linevd_rq1.sh | Run research question 1 | |
| linevd_rq2.sh | Run research question 2 | |
| linevd_rq3.sh | Run research question 3 | |
| linevd_rq5.sh | Run research question 5 | |
