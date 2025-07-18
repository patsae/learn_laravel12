<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> @yield('pageTitle') </title>

    @vite('resources/css/app.css')
</head>

<body class="bg-gray-300!">
    {{-- header bar --}}
    <div class="w-full bg-indigo-600 flex flex-row items-center text-white p-4 justify-between">
        <a href="{{ env('APP_URL') }}" class="font-bold italic">
            {{ env('APP_NAME', 'My App') }}
        </a>

        <div>
            <a href="/">Home</a>
        </div>
    </div>

    @yield('pageContent')

    @vite('resources/js/app.js')
</body>

</html>
