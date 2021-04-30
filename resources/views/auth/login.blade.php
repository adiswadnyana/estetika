@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12 text-center mb-4 mt-4">
            <img src="{{asset('img/logo-login.png')}}" width="20%">
        </div>
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
            <a class="h1"><b>EKSIS</b></a>
        </div>
                @if (session('message'))
                <div class="col-md-12 mt-3">
                    <div class="alert alert-danger alert-dismissable mb-0"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        {{ session('message') }}
                    </div>
                </div>
                @endif
                <div class="card-body mt-3">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf
                        <div class="form-group row">
                            <label for="username" class="col-md-4 col-form-label text-md-right">{{ __('Username') }}</label>
                            <div class="col-md-7">
                                <input id="username" type="text" class="form-control @error('username') is-invalid @enderror" name="username" value="{{ old('username', Session::get('username')) }}" placeholder="Masukan username.." autofocus>
                                @error('username')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>
                            <div class="col-md-7">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" placeholder="Masukan password.." autocomplete="current-password">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-7 offset-md-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                    <label class="form-check-label" for="remember">
                                        {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mb-3">
                            <div class="col-md-7 offset-md-3">
                                <button type="submit" class="btn btn-primary btn-block">
                                    <i class="fa fa-unlock"></i> {{ __('Login') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                
                <div id="loading"></div>
            </div>
        </div>
    </div>
</div>
@endsection