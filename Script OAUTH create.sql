begin
  oauth.create_client (
      p_name            => 'wha_api_webhook_client'
    , p_description     => 'Cliente para los eventos callbacks'
    , p_grant_type      => 'client_credentials'
    , p_support_email   => 'informatica@santaclara.com.py'
    , p_privilege_names => null
  );
  commit;
end;
/
SELECT *
FROM user_ords_clients

uAuOzBmq8neF1BAOIL55tg..
82CgIDzjXu_wD8av1waEYg..

/

declare
  l_roles    sys.owa.vc_arr;
  l_modules  sys.owa.vc_arr;
  l_patterns sys.owa.vc_arr;
begin
  ords.create_role(p_role_name => 'rol.whatsapp.api');

  l_roles(1)   := 'rol.whatsapp.api';
  l_modules(1) := 'Datos paciente';

  ords.define_privilege (
      p_privilege_name => 'privilegio.whatsapp.api'
    , p_roles          => l_roles
    , p_patterns       => l_patterns
    , p_modules        => l_modules
    , p_label          => 'privilegio.whatsapp.api'
    , p_description    => 'Permite acceso al modulo whatsapp_api.'
    , p_comments       => null
  );

  oauth.grant_client_role('wha_api_webhook_client', 'rol.whatsapp.api');
  commit;
end;
/
