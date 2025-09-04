<?php

require 'vendor/autoload.php';

// the one can use php -a
// inside the directory that has the vendor folder
// just add the require and the other commands

// apt install php8.1-mongodb -y
// composer require mongodb/mongodb

// script in a simple php file
// used docker image gustavovinicius/gusphp:81

$client = new MongoDB\Client('mongodb://root:example@mongo:27017');
// admin is the db, linux is the collection
$client->admin->oses->insertOne(["name" => "debian"]);
$document = $client->admin->oses->findOne(['name' => 'debian']);
print_r(json_encode($document));
$documents = $client->admin->oses->find();
foreach ($documents as $doc) { print_r(json_encode($doc)); }
