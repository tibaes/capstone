# Machine Learning Engineer Nanodegree

## Capstone Proposal

Rafael Henrique Tibães
December 1, 2017

## Proposal

### Domain Background

In biometrics there are two main operations: verification (1:1) and identification (1:N). Verification is the process to confirm a given person's identity based on its biometrics. Identification is the process to identify a person's identity based on its biometrics, i.e. searching the correspondent biometric model in the database. A naive identification algorithm would perform the verification procedure for each person stored in the database. To reduce the computational costs, a clever approach would compute indexes for each biometric model in the database. With a properly indexed database, the identification process would require to perform the verification algorithm only in a reduced subset of the database.

I am particularly interested in this problem because I need a solution for a complex newborn fingerprint identification platform that I am working with. In a real world application it would be easy to have a huge database, which would take a very long time to compute a naive identification algorithm. Proprietary technology is capable to achieve a high speed identification feedback, however they are not suitable for our needs. Kai et al. [1] uses a Convolutional Neural Network (CNN) to identify the pattern of small fingerprint patches, targeting forensics applications. In this work we adapt this algorithm to compute the most basic fingerprint indexation: the ridge pattern.

### Problem Statement

Accordingly to _NIST_ [2] there are five fundamental classes of fingerprint: i) Arch, ii) Left Loop, iii) Right Loop, iv) Tented Arch, and v) Whorl. If we could compute the fundamental type of every fingerprint, this information could be used to perform the database indexation. Using just this indexation we have a potential to perform the identification task (1:N) almost five times faster! Strong solutions to classification tasks usually rely on Convolutional Neural Network (CNN). In this work we plan to use a CNN to classify the fundamental type of a fingerprint. This is a multi-class classification problem, with well established metrics for accuracy. Given a database of labeled fingerprint images, containing the fundamental type information, the algorithm should give the same answer as the database labels.

### Datasets and Inputs

For this work, the ideal dataset should contain fingerprint images paired with notations about the fundamental type information. _NIST Special Database 4_ [2] was developed for this purpose and is free for research. In this dataset, all images are stored in gray scale _PNG_ files, having a dimension of _512 x 512_ pixels. The fingerprints images were acquired under varying conditions, so there are images with good and others with poor quality. The quality is affected mostly by the skin's humidity and the pressure applied on sensor. As result, a poor quality image have blurred borders, making it harder to distinguish ridges of valleys.

### Solution Statement

In literature there are a lot of examples of the capability that Convolution Neural Networks have to handle image classification problems. Our approach will follow a similar network as Kai et al. [1], composed by a few convolutional layers, followed by max-pooling and fully-connected layers, and finally the output layer. As input we use the dataset images. The output matches the fundamental type classes, so the output layer has only five nodes, one for each class: i) Arch, ii) Left Loop, iii) Right Loop, iv) Tented Arch, and v) Whorl. This approach allow us to measure the performance of the algorithm by computing its accuracy using the dataset labels. We use a python notebook with keras and tensorflow so our experiments can be easily replicated.

### Benchmark Model

As I did not found in literature an algorithm for this exact purpose, I will compare our approach with a random guess. In this manner, giving that we have five classes, our approach must achieve an accuracy above 20%, otherwise it would perform worse than picking a random value.

### Evaluation Metrics
_(approx. 1-2 paragraphs)_

In this section, propose at least one evaluation metric that can be used to quantify the performance of both the benchmark model and the solution model. The evaluation metric(s) you propose should be appropriate given the context of the data, the problem statement, and the intended solution. Describe how the evaluation metric(s) are derived and provide an example of their mathematical representations (if applicable). Complex evaluation metrics should be clearly defined and quantifiable (can be expressed in mathematical or logical terms).

### Project Design
_(approx. 1 page)_

In this final section, summarize a theoretical workflow for approaching a solution given the problem. Provide thorough discussion for what strategies you may consider employing, what analysis of the data might be required before being used, or which algorithms will be considered for your implementation. The workflow and discussion that you provide should align with the qualities of the previous sections. Additionally, you are encouraged to include small visualizations, pseudocode, or diagrams to aid in describing the project design, but it is not required. The discussion should clearly outline your intended workflow of the capstone project.

-----------

**Before submitting your proposal, ask yourself. . .**

- Does the proposal you have written follow a well-organized structure similar to that of the project template?
- Is each section (particularly **Solution Statement** and **Project Design**) written in a clear, concise and specific fashion? Are there any ambiguous terms or phrases that need clarification?
- Would the intended audience of your project be able to understand your proposal?
- Have you properly proofread your proposal to assure there are minimal grammatical and spelling mistakes?
- Are all the resources used for this project correctly cited and referenced?

# References

[1] Cao, Kai, and Anil K. Jain. "Latent orientation field estimation via convolutional neural network." Biometrics (ICB), 2015 International Conference on. IEEE, 2015.

[2] https://www.nist.gov/srd/nist-special-database-4

[3] https://www.nist.gov/itl/iad/image-group/resources/biometric-special-databases-and-software