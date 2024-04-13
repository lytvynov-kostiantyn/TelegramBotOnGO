### Instrution for kubeplugin plugin usage

1. File name must begin from `kubectl-`  
```bash
cp ./kubeplugin ./kubectl-kubeplugin
```
2. To use a plugin, make the plugin executable:
```bash
sudo chmod +x ./kbectl-kubeplugin
```
3. Place it anywhere in your PATH:
```bash
sudo mv ./kbectl-kubeplugin /usr/local/bin
```
4. Use it with 'kubectl' command to get statistics:\
The input will be in format: "Resource, Namespace, Name, CPU, Memory"
```bash
kubectl kubeplugin <resource_type> <namespace>
```
    