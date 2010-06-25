<h2>Trouver un utilisateur par email</h2>

<form method="post" action="<?php $this->url('authentication.userSearch') ?>">
    Email: <input type="text" name="email" />
    <input type="submit" value="Voir" />
</form>

<?php $this->includeTemplate('list.php') ?>