<?php
/*
 *Ahutor:DIEGO CASALLAS
 *Busines: SINAPSIS TECHNOLOGIES
 *Date:13/08/2023
 *Description:.....
 */
include_once('../app/Views/template/header.php');
$users=$data['users'];


 ?>
<div class="table-responsive">
<table class="table table-sm">
  <thead class="table-dark">
  <tr>
      <th scope="col">#</th>
      <th scope="col">User</th>
      <th scope="col">Password</th>
      <th scope="col">Role</th>
      <th scope="col">State</th>
    </tr>
  </thead>
  <tbody>
    <?php 
    $count=0;
    foreach($users as $user):?>
    <tr>
      <td><?=$count++?></td>
      <td><?=$user[1]?></td>
      <td><?=$user[2]?></td>
      <td><?=$user[5]?></td>
      <td><?=$user[6]?></td>
      
    </tr>
    <?php endforeach?>
  </tbody>
</table>
</div>
<?php
include_once('../app/Views/template/footer.php');
?>