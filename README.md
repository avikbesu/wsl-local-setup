# Local Setup in WSL

- [x] kind
- [x] kubectl
- [x] helm
- [ ] Charts
  - [ ] airflow
  - [ ] postgres
  - [ ] minio


### Commands
<details>
  <summary>Airflow Containers</summary>

  - Add airflow charts:
    ```bash
    helm repo add apache-airflow https://airflow.apache.org
    helm repo update
    ```
  - Download charts locally:
    ```bash
    helm pull apache-airflow/airflow --untar --destination ./chart
    ```
  - Port forward airflow-webserver container. check and update container name. 
    ```bash
    kubectl port-forward airflow-webserver-7d55647b5d-lvhzl 8090:8080 -n airflow
    ```
</details>




### Ideas 

<details>
  <summary>How mounted airflow dag folder ?</summary>

```mermaid
flowchart TD
    A[Local File Folder: /local/path/dags] -->|hostPath| B[PersistentVolume: dags-pv]
    B -->|Bound| C[PersistentVolumeClaim: dags-pvc]
    C -->|Mounted| D[Airflow Container]

    subgraph Kubernetes Cluster
        B
        C
        D
    end
```

</details>

