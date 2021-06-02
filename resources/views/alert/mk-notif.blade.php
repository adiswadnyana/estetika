@if(Session::has('alert-type'))
    <script>
        mkNotifications();
        var type = "{{ Session::get('alert-type', 'info') }}";
        switch(type){
            case 'info':
                mkNoti("{{ Session::get('message') }}",
                        {
                            sound : true,
                            status: "info",
                            link: {
                              url: "http://www.hastechbali.com/",
                              target: "_blank",
                            }
                        }
                    );
                break;

            case 'warning':
                mkNoti(
                    "Warning",
                    "{!! Session::get('message') !!}",
                        {
                            sound : true,
                            status: "warning"
                        }
                    );
                break;

            case 'success':
                mkNoti(
                        "Success",
                        "{{ Session::get('message') }}", 
                        {
                            sound : true,
                            status: "success"
                        }
                    );
                break;

            case 'error':
                mkNoti(
                        "Rejected",
                        "{{ Session::get('message') }}", 
                        {
                            sound : true,
                            status: "danger",
                        }
                    );
                break;
        }
    </script>
@endif