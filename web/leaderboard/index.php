<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/config.php");
if (!is_logged_in()) {
    header("Location: ../login/login.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bullet Hell - Leaderboard</title>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php"); ?>
    <link rel="stylesheet" href="leaderboard.css">
</head>

<body>
    <?php include($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>

    <div class="container">
    <h1 class="text-center my-5 font-page-title pixel-font text-white">LEADERBOARD</h1>
        <label class="pixel-font font-normal" for="page_size">Number of players per page:</label>
        <select class="pixel-font" name="page_size" id="page_size">
            <?php
                foreach($GLOBALS["page_sizes"] as $size) {
                    echo "<option value=\"$size\"";
                    if($size == $_SESSION["players_per_page"]) {
                        echo " selected";
                    }
                    echo ">$size</option>";
                }
            ?>
        </select>
        <div class="leaderboard-table">
            <table class="table pixel-font my-2">
                <thead class="thead">
                    <tr >
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Rank</th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Username</th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;"></th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Points</th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Winrate</th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Games played</th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Kills</th>
                        <th scope="col" class="leaderboard-head font-stats" style="font-weight: 100;">Deaths</th>
                    </tr>
                </thead>
                <tbody class="table-contents">
                    <tr>
                        <td colspan="8">Loading...</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="text-center" id="page-controls">
        </div>
    </div>

    <script src="../src/js/url_utils.js"></script>
    <script src="leaderboard.js"></script>
</body>

</html>
