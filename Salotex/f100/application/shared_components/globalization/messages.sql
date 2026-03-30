prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 100
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.14'
,p_default_workspace_id=>14331749518156511
,p_default_application_id=>100
,p_default_id_offset=>14532183965285249
,p_default_owner=>'SALOTEX'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(17552912831386604)
,p_name=>'ADJUNTO_LICITACION_ARC_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for ADJUNTO_LICITACION_ARC_UK'
,p_version_scn=>41734975896874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(45745869658419242)
,p_name=>'CAB_COBRO_NRO_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('N\00FAmero de documento ya existe, favor verificar.')
,p_version_scn=>41747031651979
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25999213106722029)
,p_name=>'CATEGORIA_GASTO_INGRESO_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for CATEGORIA_GASTO_INGRESO_UK'
,p_version_scn=>41737886875663
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(25999403110760019)
,p_name=>'CONCEPTO_GASTO_INGRESO_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for CONCEPTO_GASTO_INGRESO_UK'
,p_version_scn=>41737887475543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(40166111134788249)
,p_name=>'COSTEO_DET_AJUSTE_INV_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existen registros relacionados en costeo, favor eliminar dichos registros para poder eliminar este registro.'
,p_version_scn=>41744437576302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(101451692868643153)
,p_name=>'DEVICES_BOT'
,p_message_language=>'es-py'
,p_message_text=>'Solo puede tener un BOT activo'
,p_version_scn=>39287053354820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65737684094997039)
,p_name=>'DEVICE_SUCURSAL_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Verifique relaci\00F3n sucursal (DEVICE_SUCURSAL_FK)')
,p_version_scn=>41737409719108
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112343399056146278)
,p_name=>'ENTIDAD_NRO_DOC_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('El n\00FAmero de documento ya se esta utilizando en otra entidad. Favor verificar.')
,p_version_scn=>39279720514953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65736658926942838)
,p_name=>'ENTIDAD_SUCURSAL_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existe dependencia de datos. Sucursal/Entidad. (ENTIDAD_SUCURSAL_FK)'
,p_version_scn=>41737409573613
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(112182056547983371)
,p_name=>'ESTADO_DET_PED_IT_DESCRI_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Descripci\00F3n ya existe. (ESTADO_DET_PED_IT_DESCRI_UK)')
,p_version_scn=>41737409559295
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24939836603293847)
,p_name=>'GRUPO_PRODUCTO_DESCRI_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Ya existe descripci\00F3n de grupo. (GRUPO_PRODUCTO_DESCRI_UK)')
,p_version_scn=>41737409545475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(134272141216785532)
,p_name=>'GRUPO_PRODUCTO_PK'
,p_message_language=>'es-py'
,p_message_text=>'Id de grupo de producto ya existe. (GRUPO_PRODUCTO_PK)'
,p_version_scn=>41737409617832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24179326802315332)
,p_name=>'LICITACION_DET_PRODUCTO_PRODUCTO_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('No existe relaci\00F3n con producto. (LICITACION_DET_PRODUCTO_PRODUCTO_FK)')
,p_version_scn=>41737409512712
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(33944585773639587)
,p_name=>'LICITACION_DET_PRODUCTO_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('N\00FAmero duplicado en el lote. Verificar.')
,p_version_scn=>41742327326818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(34784385290389947)
,p_name=>'LICITACION_PK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICITACION_PK'
,p_version_scn=>41742894480410
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(33551089552941736)
,p_name=>'LICITA_DET_PROD_TMP_VENTA_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICITA_DET_PROD_TMP_VENTA_FK'
,p_version_scn=>41742028378908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(33337326230984309)
,p_name=>'LICITA_DET_PROD_TMP_VENTA_PK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICITA_DET_PROD_TMP_VENTA_PK'
,p_version_scn=>41741847051419
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38937909711428650)
,p_name=>'LICI_DETPROD_TMP_VA_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICI_DETPROD_TMP_VA_FK'
,p_version_scn=>41744088975846
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(38938297359455235)
,p_name=>'LICI_DET_PROD_LICITACION_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICI_DET_PROD_LICITACION_FK'
,p_version_scn=>41744089336435
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(85943443281276223)
,p_name=>'PAGINA_PK'
,p_message_language=>'es-py'
,p_message_text=>'Ya existe un registro anterior con ese id. (PAGINA_PK)'
,p_version_scn=>41737409602989
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(65736033550933770)
,p_name=>'PAGINA_ROL_ACT_IDX'
,p_message_language=>'es-py'
,p_message_text=>unistr('Ya existe ROL ACTIVO para esta p\00E1gina. (PAGINA_ROL_ACT_IDX)')
,p_version_scn=>39393155306670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(74637935560448383)
,p_name=>'PAGINA_ROL_PK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Error en la obtenci\00F3n de rol para pagina. (PAGINA_ROL_PK)')
,p_version_scn=>41737409589188
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(42934200931335932)
,p_name=>'PRODUCTO_BARR_FAB_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for PRODUCTO_BARR_FAB_UK'
,p_version_scn=>41744988437931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24941833916428344)
,p_name=>'PRODUCTO_DESCRI_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for PRODUCTO_DESCRI_UK'
,p_version_scn=>41737409740802
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24942058713447905)
,p_name=>'PRODUCTO_IVA_FK'
,p_message_language=>'es-py'
,p_message_text=>'No existe IVA registrado. (PRODUCTO_IVA_FK)'
,p_version_scn=>41737410078555
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(24940400377402922)
,p_name=>'PRODUCTO_TIPO_CK'
,p_message_language=>'es-py'
,p_message_text=>'Tipo de producto no definido correctamente. (PRODUCTO_TIPO_CK)'
,p_version_scn=>41737409475749
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(17501798642407580)
,p_name=>'ROL_PK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Error en la obtenci\00F3n de id para rol. ROL_PK')
,p_version_scn=>41734962402329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(52388014138639375)
,p_name=>'SECCION_DEPARTAMENTO_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for SECCION_DEPARTAMENTO_FK'
,p_version_scn=>41750157661186
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(23132216509287856)
,p_name=>'SUCURSAL_ENTIDAD_DESCRIP_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for SUCURSAL_ENTIDAD_DESCRIP_UK'
,p_version_scn=>41736802260757
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(82072271295490916)
,p_name=>'TMP_FILE_WHATSAPP_CHATS_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for TMP_FILE_WHATSAPP_CHATS_FK'
,p_version_scn=>39389083791327
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(33821967466362737)
,p_name=>'UNI_MEDI_DESC_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for UNI_MEDI_DESC_UK'
,p_version_scn=>41742218394230
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(49481560067672333)
,p_name=>'USUARIO_PUNTO_EXPEDICION_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Punto de expedici\00F3n ya fue asignado al usuario. Favor verificar.')
,p_version_scn=>41749062266600
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(74631587846323950)
,p_name=>'USUARIO_ROL_PK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Error en la asignaci\00F3n de id (USUARIO_ROL_PK)')
,p_version_scn=>39386970330605
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(113260272483339541)
,p_name=>'USUARIO_ROL_USUARIOS_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existe dependencia con este registro, no puede ser eliminado.'
,p_version_scn=>39279851708662
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(79291159062732347)
,p_name=>'WWV_FLOW_DATA_SESSION_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for WWV_FLOW_DATA_SESSION_FK'
,p_version_scn=>39388054649805
);
wwv_flow_imp.component_end;
end;
/
