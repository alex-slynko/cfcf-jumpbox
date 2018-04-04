# cfcf-jumpbox
Jumpbox specifically for CFCR projects

## Example manifest

https://github.com/alex-slynko/cfcf-jumpbox/blob/master/manifests/cfcr-jumpbox.yml

CFCR deployment has to share links to make it work.

Here is the ops-file I have used:

```yaml
- type: replace
  path: /instance_groups/name=master/jobs/name=kube-apiserver/provides?
  value:
    kube-apiserver:
      as: master
      shared: true
- type: replace
  path: /instance_groups/name=master/jobs/name=etcd/provides?
  value:
    etcd:
      as: etcd
      shared: true
```
