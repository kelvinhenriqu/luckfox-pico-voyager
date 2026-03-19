
# Procedimento de Build da Imagem Voyager

## Pré-requisitos
estar dentro da pasta principal do repositorio, já que todos os comandos são relativos a ela.


### 1. Configurar tipo de placa
```bash
sudo ./build.sh lunch
```
Seleciona 11, 0, 0 para configurar de acordo com placa luckfox.

### 2. Extrair pacotes extras
Antes de iniciar o build, extraia:

`btstack package.zip` no root do repositorio, ele contém:
- Pacote customizado para instalação do BTStack
- Correções para erros de Bluetooth

```bash
sudo unzip btstack package.zip
sudo sed -i '/skeleton-init-sysv/a\	source "package/btstack/Config.in"' sysdrv/source/buildroot/buildroot-2023.02.6/package/Config.in
```

### 3. Configurar Buildroot
```bash
sudo ./build.sh buildrootconfig
```
Importe o arquivo `.config-buildroot` localizado na raiz do repositório.

### 4. Configurar Kernel
```bash
sudo ./build.sh kernelconfig
```
Importe o arquivo `.config-kernel` localizado na raiz do repositório.

### 5. Compilar Imagem
Execute o script de build para gerar a imagem de disco completa.

```bash
sudo ./build.sh
```
O primeiro build demorara pelo menos 40 minutos, pois ira baixar e criar todo o ambiente de desenvolvimento
