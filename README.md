# FIAP - Infrastructure as Code (IaC)

Repositório dedicado à avaliação final da disciplina **Infrastructure as Code**, contemplando o provisionamento automatizado de infraestrutura na AWS via **Terraform** e automação via **GitHub Actions**.

![](img/frog.gif)

---

## 👥 Integrantes do Grupo

| RM | Nome | Papel |
| :---: | :--- | :---: |
| `371052` | **Douglas Santos Oliveira** | 💻 *Integrante* |
| `373242` | **Bruno Yamaguchi** | 💻 *Integrante* |
| `371359` | **Juan Souza de Paiva** | 💻 *Integrante* |
| `373853` | **Rafael Araújo Moreno Monteiro** | 💻 *Integrante* |
| `374304` | **Rafael Tafarello Leardini** | 💻 *Integrante* |

---

## 🚀 Visão Geral do Projeto

O projeto utiliza uma abordagem modular e escalável para implantar recursos de computação, rede, segurança e orquestração de contêineres na Amazon Web Services (AWS).

### Cobertura dos Requisitos e Bônus (FIAP)
| Requisito / Bônus | Implementação no Repositório | Status |
| :--- | :--- | :---: |
| **Deploy EC2 na AWS** | Módulo `Module/ec2` consumido em `Ambiente/` | ✅ |
| **Bônus 1: Componentes de Rede e Segurança** | Implementação de VPC e Security Group próprios (`Module/vpc` e `Module/sg`) | ✅ |
| **Bônus 2: Modularização do Código** | Estruturação de módulos reutilizáveis e independentes na pasta `Module/` | ✅ |
| **Bônus 3: Cluster / Orquestrador** | Provisionamento de Cluster Kubernetes EKS via `Module/eks` e `ambiente-eks/` | ✅ |
| **Bônus 5: Pipeline CI/CD** | Esteira automatizada via GitHub Actions em `.github/workflows/terraform-pipeline.yml` | ✅ |

---

## 📁 Estrutura do Repositório

```text
.
├── .github/
│   └── workflows/
│       └── terraform-pipeline.yml  # Esteira de CI/CD do GitHub Actions
├── Ambiente/                       # Consumer principal (EC2 + VPC + SG)
│   ├── .terraform.lock.hcl
│   ├── backend.tf                  # Gerenciamento do estado do Terraform
│   ├── main.tf                     # Invocação dos módulos
│   └── outputs.tf                  # Saídas do ambiente
├── ambiente-eks/                   # Consumer dedicado ao Cluster Kubernetes
│   ├── .terraform.lock.hcl
│   ├── backend.tf
│   └── main.tf
├── Module/                         # Módulos Terraform Reutilizáveis
│   ├── ec2/                        # Módulo para instâncias EC2
│   ├── eks/                        # Módulo para clusters Kubernetes EKS
│   ├── sg/                         # Módulo para Security Groups
│   └── vpc/                        # Módulo para Virtual Private Cloud
├── .gitignore                      # Proteção de arquivos temporários e estados
├── README.md                 # LEIA-ME
```

# Dance...dance
<img src="img/dancing-mushroom.gif" alt="Cogumelo dançante" width="50"/>

