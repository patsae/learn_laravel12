<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;

use App\Http\Controllers\PageController;

Route::controller(PageController::class)->group(function () {
    Route::get('/', "welcomePage");

    Route::get('/detail', "detailPage");

    Route::get('/login', "loginPage");
    Route::post('/login', "loginPage");
});

// Route::get("/", [PageController::class, "welcomePage"]);
// Route::get('/detail', [PageController::class, "detailPage"]);
// Route::get('/login', [PageController::class, "loginPage"]);
// Route::post('/login', [PageController::class, "loginPage"]);