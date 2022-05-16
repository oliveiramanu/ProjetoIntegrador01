<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="André Luferat - https://github.com/Luferat">
    <meta name="description" content="Aplicativo modelo full-stack usando HTML, CSS, PHP e MySQL.">
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

            <a href="/resenhas/" title="Resenhas"><i class="fa-solid fa-comment-dots fa-fw"></i><span>Resenhas</span></a>

            <a href="/contatos/" title="Faça contato"><i class="fa-solid fa-comment-dots fa-fw"></i><span>Faça Pedidos</span></a>

            <a href="/sobre/" title="Sobre..."><i class="fa-solid fa-circle-info fa-fw"></i><span>Sobre</span></a>

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