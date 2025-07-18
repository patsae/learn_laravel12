<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>เข้าสู่ระบบ</title>

    @vite('resources/css/app.css')
</head>

<body class="bg-[#f3f3f3]">
    <div class="w-2/3 bg-white rounded box-shadow p-4 mx-auto mt-8">
        <h2 class="mx-auto">เข้าสู่ระบบ</h2>
        <form class="my-3" method="POST" action="/login">
            @csrf

            {{-- <div class="flex flex-col gap-2">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" value="" />
            </div> --}}
            <x-label-with-text-box id="username" orientation="Vertical">Username</x-label-with-text-box>

            <div class="flex flex-col gap-2">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" value="" />
            </div>
            {{-- <input type="submit" class="mx-auto my-3" value="เข้าสู่ระบบ" /> --}}
            <x-button id="btnSubmit" class="active:bg-yellow-500">เข้าสู่ระบบ</x-button>

            @if (session('loginResult'))
                <p class="text-green-700 mx-auto">{{ session('loginResult') }}</p>
            @endif

            {{-- กรณี error --}}
            <p class="text-red-700 mx-auto">
                @error('username')
                    {{ $message }}
                @enderror
                @error('password')
                    {{ $message }}
                @enderror
            </p>
        </form>
    </div>
</body>

</html>
