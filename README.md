# slack-uploader-resource
Resource for Concourse CI to upload files to Slack.

![Slack](https://media.giphy.com/media/3o6Ztk4rs2uy57A7Qs/giphy.gif)

It allows you to upload files to Slack from your pipeline.

## Use the resource

Example:

```yml
---
# declare custom resource type:
resource_types:
- name: slack-uploader
  type: docker-image
  source:
    repository: andreikrasnitski/slack-uploader-resource
    tag: latest

# declare resource
resources:
- name: slack-uploader
  type: slack-uploader
  source:
    auth_token: "<Authentication token>"

# use it in your job
jobs:
- name: "Upload file to Slack"
  public: true
  plan:
    - put: slack-uploader
      params:
         channel: <Comma-separated list of channel names or IDs where the file will be shared>
         file: <Path to the file to upload, provided by an output of a task>
```
