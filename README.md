 [![WordPress](https://img.shields.io/badge/WordPress-informational)](https://wordpress.org/)
[![WooCommerce](https://img.shields.io/badge/WooCommerce-success)](https://woocommerce.com/)
[![REST API](https://img.shields.io/badge/REST%20API-lightgrey)](https://en.wikipedia.org/wiki/Representational_state_transfer)
[![Jenkins](https://img.shields.io/badge/Jenkins-red)](https://jenkins.io/)
[![Docker](https://img.shields.io/badge/Docker-blue)](https://www.docker.com/)
[![AWS](https://img.shields.io/badge/AWS-yellow)](https://aws.amazon.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-blue)](https://kubernetes.io/)
[![Nginx](https://img.shields.io/badge/Nginx-green)](https://nginx.org/en/)
[![Terraform](https://img.shields.io/badge/Terraform-7335cc)](https://www.terraform.io/)
[![Snyk](https://img.shields.io/badge/Snyk-red)](https://snyk.io/)
[![Trivy](https://img.shields.io/badge/Trivy-informational)](https://aquasecurity.com/products/trivy)
[![Python](https://img.shields.io/badge/Python-blue)](https://www.python.org/) 



# How To Deploy This Solution:


### 01- Clone the repository on your Bastion Machine.
### 02- Run Terraform Code.
### 03- Deploy APPS Using ArgoCD in the bellow order:


- Wordpress Blue/Green
- Nginx Ingress Controller
- Microservices Blue/Green


- To get ArgoCD Secret:
  
```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

- To expose argocd-server service, ane get access to it using your EC2 Bastion PublicIP.
  
```
kubectl port-forward svc/argocd-server -n argocd 4001:443 --address 0.0.0.0
```

### 04- Configure Vault Server :

- Connect to your Vault Server via SSH.

- Run:

```
sudo nano /etc/vault.d/vault.hcl
```

Past the configuration bellow on it:


```

storage "raft" {
  path    = "/opt/vault/data"
  node_id = "raft_node_1"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = 1
}

api_addr = "http://127.0.0.1:8200"
cluster_addr = "https://127.0.0.1:8201"
ui = true


```


- Run the followings commands in order: 

```

sudo systemctl start vault

sudo systemctl stop vault

sudo systemctl start vault

```



- Now we should add the ip addr of our Vault Server to our env:
- Open ".profile" by running : "sudo nano ~/.profile" and add the bellow line in it:


```
export VAULT_ADDR='http://127.0.0.1:8200'
```

- Now run : "source ~/.profile" to load your env.
- If you would to check that you did everything correctly run: "env | grep VAULT_ADDR".
- Now you can initilize your Vault Server by running, you should get 5 KEYs and login_token (SAVE THEM IN A SAFE PLACE) :

```

vault operator init

```


- Now we have to UNSEAL our Vault Server by running this command 3 TIMES, and enter the secrets that we got early "WE NEED JUST 3 SECRETS":

```

vault operator unseal

```


- After checking that the SEAL is FALSE.
  
- We Can Login Now:

```

vault login login_token

```

- Now we'll enable the AppRole Auth Mehod:

```

vault auth enable approle

```

- After it we have to create the role for Jenkins and make it usage illimit :


```

vault write auth/approle/role/jenkins-role token_num_uses=0 secret_id_num_uses=0 policies="jenkins"

```

- To get the RoleID and the RoleSecret_ID, We'll add the values later to our Jenkins Credentials :

```

vault read auth/approle/role/jenkins-role/role-id

vault write -f auth/approle/role/jenkins-role/secret-id

```

- Now we can enable The Secrets of type "KeyValues" :

 
```
vault secrets enable -path=secrets kv

```

- Finally, we'll create a Policy for our AppRole, to be able to wread all the secrets on this path "secrets/creds/":


```
nano jenkins-policy.hcl

```

```
path "secrets/creds/*" {
 capabilities = ["read"]
}

```


- If you did everything correctly, you'll be able to write your KV now:

1- First KV, is the credentials of our BuildingMachine (Jenkins Agent).

```

vault write secrets/creds/ec2_abdelatif username=ubuntu private_key="$(cat /home/ubuntu/key.pem)" passphrase=

```


[![Made with Love](https://img.shields.io/badge/Made%20with-Love-red)]



TEST 