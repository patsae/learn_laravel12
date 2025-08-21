@extends('layouts.layout')

@section('pageTitle', env('APP_NAME'))

@section('pageContent')
    <div class="box">
        <h1 class="text-center text-indigo-600 italic"> {{ env('APP_NAME') }} </h1>

        <div class="flex flex-col gap-4">

            @foreach ($attractions as $attraction)
                <div class="row">
                    <img src="{{ $attraction->image_url }}" />
                    <div class="flex flex-col">
                        <b><u>{{ $attraction->name }}</u></b>
                        <p>{{ $attraction->description }}</p>
                        <p><b>published: </b> {{ $attraction->created_at }} </p>
                    </div>
                </div>
            @endforeach

        </div>
    </div>


@endsection
