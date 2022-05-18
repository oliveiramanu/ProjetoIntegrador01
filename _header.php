<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Carol Perdigão - https://github.com/CarolPerdigao, Emanuelle Oliveira - https://github.com/oliveiramanu, Gabriel Santana - https://github.com/gabrielnetuno">
    <meta name="description" content="O BookSide foi feito para um projeto integrador ministrado pelo Senac no curso Técnico em Informática. Em prol de fazer resenhas de livros fisicos e online.">
    <link rel="shortcut icon" href="/favicon.png" type="image/png">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <title>BookSide - <?php echo $title ?></title>
</head>

<body>

    <a id="top"></a>

    <div class="wrap">

        <header>

            <a href="/" title="Página inicial"><img src="/logo.png" alt=""></a>


        </header>

        <nav>

            <a href="/" title="Página inicial"><i class="fa-solid fa-house-chimney fa-fw"></i><span>Início</span></a>

            <a href="/pedidos/" title="Faça pedidos"><i class="fa-solid fa-file-pen fa-fw"></i><span>Pedidos</span></a>

            <a href="/about/" title="Sobre..."><i class="fa-solid fa-circle-info fa-fw"></i><span>Sobre</span></a>

            <?php
            if ($user) :

            ?>

                <a href="/user/profile/" title="Perfil"><img src="<?php echo $user['user_photo'] ?>" alt="<?php echo $user['user_name'] ?>"><span>Perfil</a>

            <?php

            else :

            ?>

                <a href="/user/login/" title="Usuário"><i class="fa-solid fa-right-to-bracket fa-fw"></i><span>Login</span></a>

            <?php
            endif;
            ?>

        </nav>

        <main>