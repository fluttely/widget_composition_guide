#!/bin/bash

# Script para formatar código Dart com vírgulas finais obrigatórias
# Primeiro aplica as vírgulas finais, depois formata

echo "Aplicando vírgulas finais..."
dart fix --apply

echo "Formatando código..."
dart format .

echo "Formatação concluída!"
