# tensorflow-image-classifier

This is a tensorflow image classifier using transfer learning.
It uses an Inception v3 model that has been trained on the Google ImageNet challenge dataset.
The final layer is removed from from the model, and retained using new image inputs, and new output layer for classification.
The training is very fast, as each image can be pre-computed up to the final layer to form a tensor of length 2048.
The training then occurs with these "bottlenecks" as the inputs.

## Note

Credit to [damianmoore](https://hub.docker.com/r/damianmoore/tensorflow-image-classifier/) (as well as [TensorFlow for Poets tutorial](https://codelabs.developers.google.com/codelabs/tensorflow-for-poets/index.html)).
I modified the work to save all image bottleneck files in a single folder.
I find this more useful, since I rename the input jpgs as <sha256_hash>.jpg.
This way, the same bottleneck files can be used for multiple classification batches without needing to duplicate them.
Since computing the bottleneck files is one of the main computational tasks, it is a major time savings to not have to recompute them.

## Requirements

* Docker
* git clone this project in a directory
* Sample images in labelled directories (though you can use an example dataset shown below)


## Training

First populate `tf_files/<dataset>/<data>/<labels>` with image files, where the labelled data are in different named folders (<labels>).
To train, run the following, where the -s argument is the number of steps to train.

```
./train.sh tf_files <dataset> -s 1000
```

## Classification

To classify, run the following.

```
./classify.sh tf_files <dataset> <filepath>
```

It will output a score associated with each of the labels, with the strongest match first.
