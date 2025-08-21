<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PageController extends Controller
{
    public function welcomePage(Request $request)
    {
        $pageTitle = "theAttractions";
        $attractions = [
            [
                "image_url" => "https://dummyjson.com/image/250",
                "name" => "วัดพระแก้ว",
                "content" => "วัดคู่บ้านคู่เมืองที่ประดิษฐานพระแก้วมรกต",
                "date" => "2025-06-29 21:23:35"
            ],
            [
                "image_url" => "https://dummyjson.com/image/250",
                "name" => "พระบรมมหาราชวัง",
                "content" => "พระราชวังหลวงของไทย มีสถาปัตยกรรมงดงาม",
                "date" => "2025-06-29 21:23:35"
            ],
            [
                "image_url" => "https://dummyjson.com/image/250",
                "name" => "วัดอรุณราชวราราม",
                "content" => "วัดชื่อดังริมแม่น้ำเจ้าพระยา มีพระปรางค์สูงเด่น",
                "date" => "2025-06-29 21:23:35"
            ],
        ];
        return view("welcome", compact("pageTitle", "attractions"));
    }

    public function detailPage(Request $request)
    {
        return view("detail");
    }

    public function loginPage(Request $request)
    {
        if (!empty($request->input())) {
            $request->validate([
                "username" => "required",
                "password" => "required"
            ], [
                "username.required" => "กรุณาระบุ username",
                "password.required" => "กรุณาระบุ password",
            ]);

            return back()->with('loginResult', 'login success!');
        } else {
            return view('login');
        }
    }

    public function testdb(Request $request) {}
}
