# Machine Learning Engineer Nanodegree

## Capstone Report

Rafael Henrique Tibães

_December 21, 2017_

---

## Definition

In biometrics there are two main operations: verification (1:1) and identification (1:N). Verification is the process that confirms a person's identity based on their biometrics. Identification is the process to identify a person's identity based on its biometrics, i.e. searching the correspondent biometric model in the database. A naive identification algorithm would perform the verification procedure for each person's biometric model stored in the database. To reduce the computational costs, a clever approach would compute indexes for each biometric model in the database. With a properly indexed database, the identification process would require to perform the verification algorithm only in a reduced subset of the database.

There are a couple of biometrics modalities capable to accurately identify an individual, such as the face, fingerprint and iris. In this work we focus on fingerprints accquired by imaging sensors. Fingerprints are composed by ridges (darker pixels) and valleys (lighter pixels), where each fingerprint has an unique composition of ridges and valleys. Despite the unique composition, all fingerprints follow one of the five fundamental types, i.e. ridge patterns, described by _NIST_ [2]: i) Arch, ii) Left Loop, iii) Right Loop, iv) Tented Arch, and v) Whorl. If we could compute the fundamental type of every fingerprint, this information could be used to perform the database indexation. Using just this indexation we would be able to perform the identification task (1:N) almost five times faster!

I am particularly interested in this problem because I need a solution for a complex newborn fingerprint identification platform that I'm working on. In a real world application it would be easy to have a huge database, which would take a very long time to compute a naive identification algorithm. Proprietary technology is capable to achieve a high speed identification feedback, however they are not suitable for our needs.

Inspired by the Udacity _dog breed_ assignment, and also by the work of Kai et Al. [1], which uses a Convolutional Neural Network (CNN) to identify the pattern of small fingerprint patches, targeting forensics applications,  in this work we trained a network to compute the most basic fingerprint indexation: the ridge pattern. This is a multi-class classification problem, with well established metrics for accuracy. Given a database of labeled fingerprint images, containing the fundamental type information, the algorithm should give the same answer as the database labels.

## Analisys

For this work, the ideal dataset should contain fingerprint images paired with notations about the fundamental type information. _NIST Special Database 4_ [2][3] was developed for this purpose and is free for research. In this dataset, all images are stored in gray scale _PNG_ files, having a dimension of _512 x 512_ pixels. The fingerprints images were acquired under varying conditions, so there are images with good and others with poor quality. The quality is affected mostly by the skin's humidity and the pressure applied on sensor. As result, a poor quality image have blurred borders, making it harder to distinguish ridges from valleys.

The _NIST_ dataset contains `4000` fingerprint images, uniformly distributed along the five fundamental types, i.e. there are `800` fingerprint images of each class:  i) (A) Arch, ii) (L) Left Loop, iii) (R) Right Loop, iv) (T) Tented Arch, and v) (W) Whorl. This is an important feature, because for classification tasks it is fundamental to balance the dataset before training. Figures 1 to 5 are fingerprints samples from this dataset, to present the characteristics of each fundamental type, and Figure 6 presents the data distribution.

![Fingerprint of type Arch (A). Notice that the central part of the fingerprint is composed by smooth lines. This sample also presents a partially occluded fingerprint, because it was not acquired with focus on its center.](img/A.png)

![Fingerprint of type Tented Arch (T). Notice that the central part of the fingerprint is composed by a strong peak, in contrast to the Arch type. This sample also presents a poor quality image, as we can see that the ridges are blurred.](img/T.png)

![Fingerprint of type Whorl (W).  Notice that the central part of the fingerprint is composed by a ciclic pattern.](img/W.png)

![Fingerprint of type Right Loop (R). Notice that the central part of the fingerprint is composed by a curve on the right. ](img/R.png)

![Fingerprint of type Left Loop (L). Notice that the central part of the fingerprint is composed by a curve on the left.](img/L.png)

![Graphic of classes distribution on NIST Dataset: all samples are evenly distributed among the five classes.](img/classesDistribution.png)

## Methodology

## Results

## Conclusion

## References

# References

[1] Cao, Kai, and Anil K. Jain. "Latent orientation field estimation via convolutional neural network." Biometrics (ICB), 2015 International Conference on. IEEE, 2015.

[2] https://www.nist.gov/srd/nist-special-database-4

[3] https://www.nist.gov/itl/iad/image-group/resources/biometric-special-databases-and-software
