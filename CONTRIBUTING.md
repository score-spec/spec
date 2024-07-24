# Contributor guidelines

We are excited that you're interested in contributing to our project! Your efforts help us improve and grow.

## Code of conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to abuse@score.dev.

## Ways to contribute

There are many ways for you to contribute to the Score project, for example:

- **User feedback:** Share your feedback and impressions about the Score specification or any of our reference implementations. Your insights are incredibly helpful for us to further improve and develop the project.

- **Community engagement:** Contribute through speaking engagements, social media, or blog posts.

- **Design:**  Assist with web design to improve our online presence.

- **Documentation:** Help us identify and fix gaps or issues in our developer documentation.

- **Bug reports & fixes:** Encountered a bug or unexpected behavior? Please report it to us, and if possible, contribute a fix.

- **Feature enhancements:** Propose or work on new features for existing Score implementations.

- **Write your own Score implementation:** Score has the potential to integrate with various container orchestration tools such as Google Cloud Run, Azure Container Apps, or HashiCorp Nomad. If you're interested in creating your own Score implementation, we'd love to hear about your plans.

If you're eager to contribute but unsure where to start, reach out to us (e.g., the [Score](https://cloud-native.slack.com/archives/C07DN0D1UCW) channel in the CNCF Slack (<https://slack.cncf.io/>)), and we can explore suitable tasks together.

## Finding an issue

You can discover reported bugs, feature ideas, or discussion topics in the "Issue" section of each repository within the Score organization. Here's where you'll typically find them:

- Spec repository: [This repository](https://github.com/score-spec/spec) contains issues related to the specification or the overall behavior of reference implementations.

- Reference implementation repositories: Repositories like [score-compose](https://github.com/score-spec/score-compose), [score-k8s](https://github.com/score-spec/score-k8s), and [score-helm](https://github.com/score-spec/score-helm) each host issues specific to their respective implementations.

We strive to tag issues with labels such as "good first issue" and "help wanted" to indicate which tasks are up for grabs. If you're having trouble finding a suitable issue, don't worry! As mentioned above, there's likely still an opportunity for you to contribute. Reach out to us, and we'll help you find a task to start with.

## How to get in touch

You can reach us anytime on the [Score](https://cloud-native.slack.com/archives/C07DN0D1UCW) channel in the CNCF Slack (<https://slack.cncf.io/>), where we'll be also be announcing community meetings and events. Additionally, feel free to drop in during our office hours every Thursday between 3-4 pm CET to discuss any issues or questions you have.

## Legal

When contributing to this project, you must agree that you have authored the content, that you have the necessary rights to the content and that the content you contribute may be provided under the [APACHE LICENSE, VERSION 2.0](LICENSE).

### Signoff Your Commits

We kindly ask contributors to sign off on commits submitted to our project's repositories. This sign-off, known as the Developer Certificate of Origin (DCO), verifies that you are the author of the code and have the necessary rights to contribute it. To provide your sign-off, include the following line in your commit messages, ensuring it matches your git user and email:

```bash
This is my commit message

Signed-off-by: Your Name <your.name@example.com>
```

Git has a -s command line option to do this automatically:

``` bash
git commit -s -m 'This is my commit message'
```

If you forgot to do this and have not yet pushed your changes to the remote repository, you can amend your commit with the sign-off by running

``` bash
git commit --amend -s
```

## Example contribution workflow

Here's a quick rundown of how a typical code- or documentation contribution would look like in our project:

1. Find a contribution you would like to make. Learn more about [ways to contribute](#ways-to-contribute).

2. Fork the repository associated with the issue to your local GitHub organization. This means that you will have a copy of the repository under **your-GitHub-username/repository-name**.

3. Clone the repository to your local machine using **git clone**.

4. Create a new branch for your fix using **git checkout -b your-branch-name**.

5. Make the appropriate changes for the issue you are trying to address or the feature that you want to add.

6. Use **git add insert-paths-of-changed-files-here** to add the file contents of the changed files to the "snapshot" git uses to manage the state of the project, also known as the index.

7. Use **git commit -s -m "Insert a brief message of the changes made here"** to store the contents of the index with a descriptive message.

8. Push the changes to the remote repository using **git push origin your-branch-name**.

9. Submit a pull request to the upstream repository.

10. Title the pull request with a brief description of the changes made and the issue or bug number associated with your change. For example, you can title an issue like so, "Added more log outputting to resolve #4352".

11. In the description of the pull request, explain the changes that you made, any issues you think exist with the pull request you made, and any questions you have for the maintainer. It's OK if your pull request is not perfect (no pull request is), the reviewer will be able to help you resolve any problems and improve it.

12. Wait for the pull request to be reviewed by a maintainer.

13. Introduce changes to the pull request if the reviewing maintainer recommends them.

14. Merge your pull request once approved.

15. Celebrate your success after your pull request is merged!

 If you have any questions or need assistance, feel free to reach out to us. We're here to help!
