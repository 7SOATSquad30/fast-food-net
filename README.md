# Infraestrutura AWS com Terraform

Este projeto cria uma infraestrutura básica na AWS utilizando o Terraform. Ele inclui a criação de uma VPC, subnets públicas e privadas, um gateway NAT, e tabelas de rotas para gerenciar o tráfego de rede.

## Índice

- [Descrição](#descrição)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [Contribuição](#contribuição)

## Descrição

Este projeto utiliza o Terraform para provisionar uma infraestrutura na AWS. A infraestrutura inclui:
- Uma VPC com um bloco CIDR configurável.
- Subnets privadas e públicas distribuídas em diferentes zonas de disponibilidade.
- Um Internet Gateway para permitir o tráfego de saída das subnets públicas.
- Um NAT Gateway para permitir que as subnets privadas acessem a internet.
- Tabelas de rotas para gerenciar o tráfego de rede entre as subnets e a internet.

## Pré-requisitos

Antes de começar, certifique-se de que você atendeu aos seguintes requisitos: - Você tem uma conta na [AWS](https://aws.amazon.com/).
- Você instalou o [Terraform](https://www.terraform.io/downloads.html) (versão >= 1.0.0).
- Você configurou suas credenciais da AWS localmente (via `aws configure` ou variáveis de ambiente). 

## Instalação

Para instalar e configurar o projeto, siga estas etapas: 

1. Clone o repositório: 
```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
```
2. Acesse o diretório do projeto:
```bash
cd seu-repositorio
```
3. Inicialize o Terraform:
```bash
terraform init
```
4. Defina as variáveis necessárias no arquivo terraform.tfvars ou diretamente no terminal. Exemplo de variáveis:

```bash
aws_region = "us-east-1"
vpc_cidr = "10.0.0.0/16"
subnet_1_cidr = "10.0.1.0/24"
subnet_2_cidr = "10.0.2.0/24"
subnet_3_cidr = "10.0.3.0/24"
subnet_4_public_cidr = "10.0.4.0/24"
availability_zone_1 = "us-east-1a"
availability_zone_2 = "us-east-1b"
availability_zone_3 = "us-east-1c"
```
5. Aplique o plano do Terraform para provisionar a infraestrutura:
```bash
terraform apply
```
6. Confirme a execução digitando ```yes``` quando solicitado.

## Uso
Após a execução bem-sucedida do Terraform, a infraestrutura será provisionada na AWS. Os seguintes recursos serão criados:

- VPC: Uma VPC com o bloco CIDR especificado.
- Subnets: Três subnets privadas e uma subnet pública.
- Internet Gateway: Um gateway para permitir o tráfego de saída da subnet pública.
- NAT Gateway: Um gateway NAT para permitir que as subnets privadas acessem a internet.
- Tabelas de Rotas: Tabelas de rotas para gerenciar o tráfego de rede.

### Outputs
Após a execução, o Terraform exibirá os seguintes outputs:

- vpc_id: O ID da VPC criada.
- subnet_1_id: O ID da primeira subnet privada.
- subnet_2_id: O ID da segunda subnet privada.
- subnet_3_id: O ID da terceira subnet privada.
- default_security_group: O ID do grupo de segurança padrão da VPC.

## Contribuição

Se você quiser contribuir com este projeto, siga estas etapas:

Faça um fork do repositório.

Crie um branch para sua feature (```git checkout -b feature/nova-feature```).

Faça commit das suas alterações (```git commit -m 'Adiciona nova feature'```).

Envie para o branch (```git push origin feature/nova-feature```).

Abra um Pull Request.