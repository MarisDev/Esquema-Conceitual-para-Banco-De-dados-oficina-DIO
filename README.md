# 🚗 Oficina Mecânica – Esquema Conceitual de Banco de Dados

Este repositório contém o esquema conceitual de um sistema de **controle e gerenciamento de ordens de serviço em uma oficina mecânica**.

## 🎯 Objetivo
Cria o esquema conceitual para o contexto de oficina com base na narrativa fornecida

## 📖 Narrativa
- Clientes levam veículos à oficina mecânica para reparos ou revisões.  
- Cada veículo é designado a uma equipe de mecânicos, que abre uma **Ordem de Serviço (OS)** com data de entrega.  
- A OS registra serviços (consultados em tabela de mão de obra) e peças utilizadas.  
- O cliente autoriza os serviços.  
- A mesma equipe avalia e executa os serviços.  
- Cada mecânico possui código, nome, endereço e especialidade.  
- Cada OS possui: número, data de emissão, valor, status e previsão de conclusão.

## 🏗️ Modelo Conceitual (EER)
- **Cliente** possui um ou mais **Veículos**.  
- Cada **Veículo** pode gerar várias **Ordens de Serviço (OS)**.  
- Cada **OS** é atribuída a uma **Equipe**, que é composta por vários **Mecânicos**.  
- Uma **OS** pode incluir diversos **Serviços** e **Peças**.
