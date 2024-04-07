## Comparison of tools for running a local Kubernetes cluster

### Characteristics

|                                | Minikube                                                                                                                    | Kind (Kubernetes IN Docker)                                              | k3d                                                                                     |
|--------------------------------|-----------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Supported OS and Architectures | linux/amd64, linux/arm64, linux/arm, linux/ppc64le, linux/s390x, darwin/amd64, darwin/arm64, windows/amd64                  | linux/amd64, linux/arm64, darwin/amd64, darwin/arm64, windows/amd64      | macOS/amd64, macOS/arm64, Linux/386, Linux/amd64, Linux/arm, Linux/arm64, Windows/amd64 |
| Automation Capability          | Cluster creation and management as VM or Docker containers, or on bare-metal                                                | Creation of local clusters in Docker containers                          | create single- and multi-node k3s clusters in docker                                    |
| Monitoring and management      | minikube has integrated support for the Kubernetes Dashboard UI.                                                            | kubectl                                                                  | kubectl                                                                                 |
| Advantages                     | Kubernetes recommends it as a tool for familiarization. Quite a large community. Suitable for local development and testing | Suitable for local development and testing                               | Chosen for preparing Proof of Concept (PoC). Suitable for local development and testing |
| Flaws                          | Doubts about scalability                                                                                                    | Limited documentation                                                    | Limited documentation                                                                   |

#### Docker vs Podman
Podman is a capable containerization technology that offers a viable alternative to Docker for running container 
workloads. Whether you choose Podman or Docker depends entirely on your specific needs and preferences.

Podman can do most of the things that Docker can do, with the added benefit of not requiring a daemon running in 
the background. On top of that, Podman offers some features that Docker does not, such as working with Kubernetes 
manifest files and organizing individual containers into pods.

The final decision is yours. If you require a more lightweight and secure container management solution, Podman 
might be a better choice. However, Docker may be the way to go if you prioritize a robust ecosystem with extensive 
community support. Ultimately, both tools offer powerful containerization capabilities to meet your requirements.
### Demonstration
#### minikube demo
![Image](.data/minikube.gif)
#### Kind demo            
![Image](.data/kind.gif) 
#### k3d demo
![Image](.data/k3d.gif) 
### Conclusion
k3d stands out as the recommended tool for AsciiArtify's PoC. Its quick cluster creation and simplicity make it 
suitable for initial development but also has its drawbacks.  Additionally, it's important to delve deeper into 
potential scalability issues with Minikube.