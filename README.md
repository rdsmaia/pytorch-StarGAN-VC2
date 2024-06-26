# pytorch-StarGAN-VC2

This is a PyTorch implementation of the paper: [StarGAN-VC2: Rethinking Conditional Methods for StarGAN-Based Voice Conversion](https://arxiv.org/abs/1907.12279). 

Support [VCC2016](http://www.vc-challenge.org/vcc2016/index.html) , [VCC2018](http://www.vc-challenge.org/vcc2018/index.html) , [CETUC](http://www02.smt.ufrj.br/~igor.quintanilha/alcaim.tar.gz) three datasets.

Many thanks for Oscar Hsu (https://github.com/Oscarshu0719) for providing the original repo!

## Dependencies
- Python 3.6+
- pytorch 1.0+
- scikit-learn
- librosa 
- pyworld 
- tensorboardX

## Test environment
- Ubuntu 18.04 LTS
- Intel(R) Core(TM) i9-9900K CPU @ 3.60GHz
- NVIDIA TITAN V
- 12 GB RAM
- python 3.7
- pytorch 1.8.0
- scikit-learn 0.22.1
- librosa 0.6.1
- pyworld 0.2.8
- tensorboardx 2.0

## Usage

### Download dataset

#### Download the CETUC dataset to `./data`.

``` 
python download.py [--dataset dataset]

dataset: 
    Downloaded dataset. 
    Available datasets: VCC2016, VCC2018, CETUC.
    e.g. Download dataset CETUC.
        CETUC

e.g. Download dataset CETUC.
    python download.py --dataset CETUC.

Notice:
    Details of other arguments are in `download.py`.
```

#### Move the corresponding speakers to the training and testing directories.

```
bash move_data.sh [dataset] [speakers_list]

dataset:
    Used dataset. 
    Available datasets: VCC2016, VCC2018 (case insensitive).
    e.g. Use dataset VCC2016.
        VCC2016

speakers_list
    List of training and testing speakers.
    e.g. Train and test four speakers SF1, SF2, TM1, and TM2.
        SF1, SF2, TM1, TM2

e.g. Use dataset VCC2016. Train and test four speakers SF1, SF2, TM1, and TM2.
    bash move_data.sh VCC2016 SF1 SF2 TM1 TM2
```

1. **Training set**: According to the paper, move directories SF1, SF2, TM1, TM2 to `./data/spk`.
2. **Testing set**: According to the paper, move directories SF1, SF2, TM1, TM2 to `./data/spk_test`.

Directory structure: 

```
data
├── spk 
│   ├── SF1
│   ├── SF2
│   ├── TM1
│   └── TM2
├── spk_test
│   ├── SF1
│   ├── SF2
│   ├── TM1
│   └── TM2
├── vcc2016_training (vcc 2016 training set)
│   ├── ...
├── evaluation_all (vcc 2016 evaluation set, we use it as testing set)
│   ├── ...
```

### Preprocess

Extract WORLD features (MCEPs, F0, AP) from each speech clip.

```
python [-W ignore] preprocess.py [--dataset dataset]

-W ignore:
    Ignore warnings.

dataset:
    Used dataset. Main reason is to determine sample rate.
    Available datasets: VCC2016, VCC2018, CETUC.
    e.g. Use dataset CETUC.
        CETUC

e.g. Use dataset CETUC and ignore warnings.
    python -W ignore preprocess.py --dataset CETUC

Notice:
    Details of other arguments are in `preprocess.py`.
```

### Train

```
python main.py [--dataset dataset]

dataset:
    Used dataset. Main reason is to determine sample rate.
    Available datasets: VCC2016, VCC2018, CETUC.
    e.g. Use dataset CETUC.
        CETUC

e.g. Use dataset CETUC and train.
    python main.py --dataset CETUC

Notice:
    Details of other arguments are in `main.py`.
```

### Convert (**** under construction for CETUC dataset ****)

```
python main.py --mode convert [--src_speaker src_speaker] [--trg_speaker trg_speaker_list] [--test_iters test_iters] [--dataset dataset]

src_speaker:
    Source of speaker (quotation marks are neccessary).
    e.g. Source speaker is VCC2SM1.
        "VCC2SM1"

trg_speaker_list:
    List of target of speakers (quotation marks are neccessary).
    e.g. Target speakers are VCC2SM1 and VCC2SF1.
        "['VCC2SM1', 'VCC2SF1']"

dataset:
    Used dataset. Main reason is to determine sample rate.
    Available datasets: VCC2016, VCC2018.
    e.g. Use dataset VCC2016.
        VCC2016

e.g. Convert from speaker VCC2SM1 to speakers VCC2SM1 and VCC2SF1 at step 100000 using sample rate of VCC2018.
    python main.py --mode convert --src_speaker "VCC2SM1" --trg_speaker "['VCC2SM1', 'VCC2SF1']" --test_iters 100000 --dataset VCC2018
    
Notice:
    Details of other arguments are in `main.py`.
```

### Tensorboard

```
tensorboard --logdir='./outputs/logs/'
```

Then open `http://localhost:6006/` in browser.

## References

### Code

[pytorch-StarGAN-VC](https://github.com/Oscarshu0719/pytorch-StarGAN-VC2) by [Oscarshu0719](https://github.com/Oscarshu0719).

[pytorch-StarGAN-VC](https://github.com/hujinsen/pytorch-StarGAN-VC) by [hujinshen](https://github.com/hujinsen).

[StarGAN-Voice-Conversion-2](https://github.com/SamuelBroughton/StarGAN-Voice-Conversion-2) by [SamuelBroughton](https://github.com/SamuelBroughton).

### Paper

[StarGAN-VC2: Rethinking Conditional Methods for StarGAN-Based Voice Conversion](https://arxiv.org/abs/1907.12279)

[StarGAN-VC: Non-parallel many-to-many voice conversion with star generative adversarial networks](https://arxiv.org/abs/1806.02169)

## License

MIT License.
