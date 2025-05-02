<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/utils.php");
require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/links.php");
if (!is_logged_in()) {
    header("Location: ../login/login.php");
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="profile.css">
    <title>
        <?php echo $_SESSION['username']; ?>
    </title>
</head>

<body>
    <?php require_once($_SERVER['DOCUMENT_ROOT'] . "/bullet_hell/web/src/php/header.php"); ?>

    <div class="container-fluid"> <div class="row"> <div class="col-lg-4 col-md-5 col-12 profile-pic-container">
                 <?php
                    // Ensure $conn is available
                    if (isset($conn)) {
                        $query = "SELECT player_skins.display_image as `display_image` FROM player_skins INNER JOIN players ON players.active_skin_id = player_skins.id WHERE players.username = ?;";
                        $stmt = $conn->prepare($query);
                         if ($stmt) {
                            $stmt->bind_param("s", $_SESSION["username"]);
                            $stmt->execute();
                            $result = $stmt->get_result();
                            if ($row = $result->fetch_assoc()) { // Check if a row exists
                                echo "<img src='../src/images/characters/" . htmlspecialchars($row['display_image']) . "' class='img-fluid anti-alias mx-auto profile-image mb-3' alt='player character'>";
                            }
                             $stmt->close();
                         } else {
                             echo "<p class='text-danger'>Error preparing database statement.</p>";
                         }
                    } else {
                         echo "<p class='text-danger'>Database connection not available.</p>";
                    }
                 ?>
                <h1 class="fw-1 text-center text-uppercase font-title" id="username">
                    <?php echo htmlspecialchars($_SESSION['username']); ?>
                </h1>
            </div>

            <div class="col-lg-8 col-md-7 col-12 profile-data-container">
                <div class="container"> <div class="row">
                        <h1 class="text-center my-4 font-page-title">Stats</h1>
                        <hr>
                    </div>
                    <div class="row text-center mb-4"> <div class="col-lg-4 col-md-6 col-sm-12 mb-3"> <div class="stat-card p-4 h-100"> <h3 class="font-title" id="stat-points">-</h3>
                                 <h3 class="font-stat">Points</h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 mb-3">
                             <div class="stat-card p-4 h-100">
                                 <h3 class="font-title" id="stat-winrate">-</h3>
                                 <h3 class="font-stat">Winrate</h3>
                             </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 mb-3">
                             <div class="stat-card p-4 h-100">
                                 <h3 class="font-title" id="stat-gamesplayed">-</h3>
                                 <h3 class="font-stat">Games Played</h3>
                             </div>
                        </div>
                         <div class="col-lg-4 col-md-6 col-sm-12 mb-3">
                             <div class="stat-card p-4 h-100">
                                 <h3 class="font-title" id="stat-kills">-</h3>
                                 <h3 class="font-stat">Total Kills</h3>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 mb-3">
                             <div class="stat-card p-4 h-100">
                                 <h3 class="font-title" id="stat-deaths">-</h3>
                                 <h3 class="font-stat">Total Deaths</h3>
                             </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-12 mb-3" title="Player's active music kit">
                             <div class="stat-card p-4 h-100">
                                 <h3 class="font-title" id="stat-music">No music</h3>
                                 <h3 class="font-stat">Active Kit</h3>
                            </div>
                        </div>
                    </div>
                    <hr>
                 </div>

                 <div class="change-pw container mt-4"> <h1 class="mb-3 font-title">Change password</h1>
                     <hr>
                     <h4 class="text-success d-none bg-light font-normal p-2" id="password-changed">Password changed successfully!</h4> <div class="row">
                         <div class="col-md-8 col-lg-6 mx-auto"> <div class="mb-3">
                                 <label for="current-pw" class="form-label font-normal">Current Password</label>
                                 <input type="password" class="form-control credential-input font-normal" id="current-pw" aria-describedby="currentPwHelp">
                                 <p class="text-danger d-none mt-1" id="incorrect-password">Incorrect password!</p> </div>
                             <div class="mb-3">
                                 <label for="new-pw" class="form-label font-normal">New Password</label>
                                 <input type="password" class="form-control credential-input" id="new-pw">
                             </div>
                             <div class="mb-3">
                                 <label for="new-pw-again" class="form-label font-normal">Repeat New Password</label>
                                 <input type="password" class="form-control credential-input" id="new-pw-again">
                                 <p class="text-danger d-none mt-1" id="password-mismatch">Passwords do not match!</p> </div>
                             <button type="button" class="btn btn-secondary font-normal mb-5" id="credential-submit-button" onclick="changePassword()">Change</button> </div>
                     </div>
                 </div>
            </div> </div> </div> <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

    <script src="<?php echo '/bullet_hell/web/profile/load_profile_data.js'; ?>" defer></script>
    <script src="<?php echo '/bullet_hell/web/profile/change_password.js'; ?>" defer></script>
    <script src="<?php echo '/bullet_hell/web/src/js/form_utils.js'; ?>" defer></script>
    </body>

</html>