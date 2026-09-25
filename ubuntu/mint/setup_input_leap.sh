#!/usr/bin/env bash
# Script de automação e instalação do Input Leap portátil para Linux Mint

set -e

# Endereço IP do servidor Windows (Altere aqui se o IP mudar no futuro)
SERVER_IP="192.168.1.110"

echo "=================================================="
echo "   Configurando o Input Leap no Linux Mint"
echo "=================================================="

# 1. Verificação e instalação das dependências do sistema
echo "[1/3] Verificando dependências necessárias..."
DEPS=(
    libqt6widgets6
    libavahi-compat-libdnssd1
    libei1
    libei-dev
    libeis1
    libportal1
    libportal-qt6-1
    libportal-gtk4-1
)

sudo apt update -y
sudo apt install -y "${DEPS[@]}"

# 2. Instalação dos arquivos no sistema
echo "[2/3] Copiando arquivos para os diretórios globais do sistema..."
if [ -d "bin" ] && [ -d "share" ]; then
    sudo cp bin/* /usr/local/bin/
    sudo cp share/applications/io.github.input_leap.input-leap.desktop /usr/share/applications/ 2>/dev/null || true
    
    if [ -d "share/icons" ]; then
        sudo cp -r share/icons/hicolor /usr/share/icons/
    fi
    
    if [ -d "share/metainfo" ]; then
        sudo cp share/metainfo/io.github.input_leap.input-leap.appdata.xml /usr/share/metainfo/ 2>/dev/null || true
    fi
    echo "Instalação no sistema concluída com sucesso!"
else
    echo "Aviso: Pastas 'bin' ou 'share' não encontradas no diretório atual."
    echo "Garantindo apenas a execução do binário local caso exista..."
fi

# 3. Conexão com o servidor
echo "[3/3] Iniciando o cliente Input Leap sem criptografia..."
echo "Conectando ao servidor $SERVER_IP..."

if command -v input-leapc &> /dev/null; then
    input-leapc -f --debug INFO --disable-crypto "$SERVER_IP"
elif [ -f "./bin/input-leapc" ]; then
    ./bin/input-leapc -f --debug INFO --disable-crypto "$SERVER_IP"
else
    echo "Erro: Executável do Input Leap não encontrado!"
    exit 1
fi
