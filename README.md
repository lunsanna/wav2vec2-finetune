# wav2vec2-finetune

This projec is a refactored version of the `l2-speech-scoring-tools` developed by [Aalto-speech](https://github.com/aalto-speech/l2-speech-scoring-tools). The refactoring was done for my own understanding and practice. This project will be developed further for my master's thesis by adding data augmentation. 

Since the data is not public as of the creating of project, you will need access to Aalto's database to reproduce the results.

### Brief description
- `config.yml` contains all the model, data and training parameters.
- `environment.yml` defines the conda env that the code is run on.
- `run_finetune.py` fine-tunes the model pre-trained on native speech. 
- `run_predict.py` used fine-tuned models for prediction. 
- `run_finetune.sh` runs `run_finetune.py` on Triton.
- `run_predict.sh` runs `run_predict.py` on Triton.
- `augmentations` folder contains everything to do with data augmentation. 
- `helper` folder contains all the functions that are not directly run in main(). 
- `others` files that are reference and can be remove later. 

### Get started 
1. Clone this repo and cd into it
2. Create conda env 
```
conda env create --file environment.yml
```
3. Install WavAugment 
```
git clone git@github.com:facebookresearch/WavAugment.git && cd WavAugment && python setup.py develop
```
4. Run the code on Triton
- Check `config.yml` to see if all parameters look good. 
- Check `run.sh` and set `--lang` to the desired language (either `fi` or `sv`).
- And then run: 
```
sbatch run.sh
```
