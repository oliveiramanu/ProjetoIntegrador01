<?php

require($_SERVER['DOCUMENT_ROOT'] . '/_config.php');

$artigos = '';

$sql = <<<SQL
SELECT art_id, art_title, art_intro, art_thumb 
    FROM articles
WHERE art_status = 'on'
    AND art_date <= NOW()
ORDER BY art_date DESC;
SQL;

$res = $conn->query($sql);

$artigos = '<div class="items">' . "\n";

while ($artigo = $res->fetch_assoc()) :

    $artigos .= <<<HTML
        <div class="item" onclick="location.href='/ler/?id={$artigo['art_id']}'">
            <div class="thumb" style="background-image: url('{$artigo['art_thumb']}')" title="Imagem de {$artigo['art_title']}"></div>
            <div class="body">
                <h4>{$artigo['art_title']}</h4>
                <span>{$artigo['art_intro']}</span>
            </div>
        </div>
HTML;

endwhile;

$artigos .= '</div>';

$title = "The book on the table...";

require($_SERVER['DOCUMENT_ROOT'] . '/_header.php');

?>

<section>

    <?php

    echo $artigos;

    ?>

</section>

<aside>

    <h3>Categorias</h3>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>
    <p>THE BOOKS ON THE TABLE.</p>

</aside>

<?php

/**
 * Inclui o rodapé da página.
 */
require($_SERVER['DOCUMENT_ROOT'] . '/_footer.php');