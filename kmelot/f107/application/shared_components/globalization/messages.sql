prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 107
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.5'
,p_default_workspace_id=>117171203325035555
,p_default_application_id=>107
,p_default_id_offset=>119233525571656138
,p_default_owner=>'KMELOT'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136786438403042742)
,p_name=>'ADJUNTO_LICITACION_ARC_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for ADJUNTO_LICITACION_ARC_UK'
,p_version_scn=>41734975896874
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148996491279054662)
,p_name=>'CAB_AJU_INV_ORP_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Detalle de orden de producci\00F3n con registro en ajuste de inventario.')
,p_version_scn=>39414855126017
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(164979395230075380)
,p_name=>'CAB_COBRO_NRO_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('N\00FAmero de documento ya existe, favor verificar.')
,p_version_scn=>41747031651979
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139270009819305595)
,p_name=>'CAB_ORDEN_RECETA_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Orden de fabricaci\00F3n relacionada a esta receta. No se puede eliminar.')
,p_version_scn=>39414440070690
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145232738678378167)
,p_name=>'CATEGORIA_GASTO_INGRESO_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for CATEGORIA_GASTO_INGRESO_UK'
,p_version_scn=>41737886875663
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(145232928682416157)
,p_name=>'CONCEPTO_GASTO_INGRESO_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for CONCEPTO_GASTO_INGRESO_UK'
,p_version_scn=>41737887475543
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(159399636706444387)
,p_name=>'COSTEO_DET_AJUSTE_INV_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existen registros relacionados en costeo, favor eliminar dichos registros para poder eliminar este registro.'
,p_version_scn=>41744437576302
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148987974280099676)
,p_name=>'DET_ORDEN_MAT_CAB_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Detalle de orden de producci\00F3n con insumos registrados.')
,p_version_scn=>39414854772241
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(173266113941200186)
,p_name=>'DET_ORDEN_OPE_CAB_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Detalle de orden de producci\00F3n tiene detalle de costeo operativo registrado, verificar.')
,p_version_scn=>39414854627589
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(173116968339403259)
,p_name=>'DET_RECETA_CAB_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existen registros en detalle de receta.'
,p_version_scn=>39414440168575
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(220685218440299291)
,p_name=>'DEVICES_BOT'
,p_message_language=>'es-py'
,p_message_text=>'Solo puede tener un BOT activo'
,p_version_scn=>39287053354820
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184971209666653177)
,p_name=>'DEVICE_SUCURSAL_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Verifique relaci\00F3n sucursal (DEVICE_SUCURSAL_FK)')
,p_version_scn=>41737409719108
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(231576924627802416)
,p_name=>'ENTIDAD_NRO_DOC_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('El n\00FAmero de documento ya se esta utilizando en otra entidad. Favor verificar.')
,p_version_scn=>39279720514953
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184970184498598976)
,p_name=>'ENTIDAD_SUCURSAL_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existe dependencia de datos. Sucursal/Entidad. (ENTIDAD_SUCURSAL_FK)'
,p_version_scn=>41737409573613
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(231415582119639509)
,p_name=>'ESTADO_DET_PED_IT_DESCRI_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Descripci\00F3n ya existe. (ESTADO_DET_PED_IT_DESCRI_UK)')
,p_version_scn=>41737409559295
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(148993084800071685)
,p_name=>'FK_OPT_ORDEN'
,p_message_language=>'es-py'
,p_message_text=>unistr('Detalle de orden de producci\00F3n, tama\00F1os a producir con datos.')
,p_version_scn=>39414854934612
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173362174949985)
,p_name=>'GRUPO_PRODUCTO_DESCRI_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Ya existe descripci\00F3n de grupo. (GRUPO_PRODUCTO_DESCRI_UK)')
,p_version_scn=>41737409545475
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(253505666788441670)
,p_name=>'GRUPO_PRODUCTO_PK'
,p_message_language=>'es-py'
,p_message_text=>'Id de grupo de producto ya existe. (GRUPO_PRODUCTO_PK)'
,p_version_scn=>41737409617832
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(143412852373971470)
,p_name=>'LICITACION_DET_PRODUCTO_PRODUCTO_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('No existe relaci\00F3n con producto. (LICITACION_DET_PRODUCTO_PRODUCTO_FK)')
,p_version_scn=>41737409512712
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(153178111345295725)
,p_name=>'LICITACION_DET_PRODUCTO_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('N\00FAmero duplicado en el lote. Verificar.')
,p_version_scn=>41742327326818
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(154017910862046085)
,p_name=>'LICITACION_PK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICITACION_PK'
,p_version_scn=>41742894480410
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152784615124597874)
,p_name=>'LICITA_DET_PROD_TMP_VENTA_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICITA_DET_PROD_TMP_VENTA_FK'
,p_version_scn=>41742028378908
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(152570851802640447)
,p_name=>'LICITA_DET_PROD_TMP_VENTA_PK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICITA_DET_PROD_TMP_VENTA_PK'
,p_version_scn=>41741847051419
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(158171435283084788)
,p_name=>'LICI_DETPROD_TMP_VA_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICI_DETPROD_TMP_VA_FK'
,p_version_scn=>41744088975846
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(158171822931111373)
,p_name=>'LICI_DET_PROD_LICITACION_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for LICI_DET_PROD_LICITACION_FK'
,p_version_scn=>41744089336435
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(205176968852932361)
,p_name=>'PAGINA_PK'
,p_message_language=>'es-py'
,p_message_text=>'Ya existe un registro anterior con ese id. (PAGINA_PK)'
,p_version_scn=>41737409602989
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(184969559122589908)
,p_name=>'PAGINA_ROL_ACT_IDX'
,p_message_language=>'es-py'
,p_message_text=>unistr('Ya existe ROL ACTIVO para esta p\00E1gina. (PAGINA_ROL_ACT_IDX)')
,p_version_scn=>39393155306670
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(193871461132104521)
,p_name=>'PAGINA_ROL_PK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Error en la obtenci\00F3n de rol para pagina. (PAGINA_ROL_PK)')
,p_version_scn=>41737409589188
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(162167726502992070)
,p_name=>'PRODUCTO_BARR_FAB_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for PRODUCTO_BARR_FAB_UK'
,p_version_scn=>41744988437931
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175359488084482)
,p_name=>'PRODUCTO_DESCRI_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for PRODUCTO_DESCRI_UK'
,p_version_scn=>41737409740802
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144175584285104043)
,p_name=>'PRODUCTO_IVA_FK'
,p_message_language=>'es-py'
,p_message_text=>'No existe IVA registrado. (PRODUCTO_IVA_FK)'
,p_version_scn=>41737410078555
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(173029725666497911)
,p_name=>'PRODUCTO_TAMANHO_EST_CK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for PRODUCTO_TAMANHO_EST_CK'
,p_version_scn=>41751015674769
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(144173925949059060)
,p_name=>'PRODUCTO_TIPO_CK'
,p_message_language=>'es-py'
,p_message_text=>'Tipo de producto no definido correctamente. (PRODUCTO_TIPO_CK)'
,p_version_scn=>41737409475749
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(139274236215283866)
,p_name=>'REC_PROD_TAM_CAB_RECET_PRO_FK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Existen detalles de tama\00F1os en receta, verificar.')
,p_version_scn=>39414440242034
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(136735324214063718)
,p_name=>'ROL_PK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Error en la obtenci\00F3n de id para rol. ROL_PK')
,p_version_scn=>41734962402329
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(171621539710295513)
,p_name=>'SECCION_DEPARTAMENTO_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for SECCION_DEPARTAMENTO_FK'
,p_version_scn=>41750157661186
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(142365742080943994)
,p_name=>'SUCURSAL_ENTIDAD_DESCRIP_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for SUCURSAL_ENTIDAD_DESCRIP_UK'
,p_version_scn=>41736802260757
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(201305796867147054)
,p_name=>'TMP_FILE_WHATSAPP_CHATS_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for TMP_FILE_WHATSAPP_CHATS_FK'
,p_version_scn=>39389083791327
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(153055493038018875)
,p_name=>'UNI_MEDI_DESC_UK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for UNI_MEDI_DESC_UK'
,p_version_scn=>41742218394230
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(168715085639328471)
,p_name=>'USUARIO_PUNTO_EXPEDICION_UK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Punto de expedici\00F3n ya fue asignado al usuario. Favor verificar.')
,p_version_scn=>41749062266600
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(193865113417980088)
,p_name=>'USUARIO_ROL_PK'
,p_message_language=>'es-py'
,p_message_text=>unistr('Error en la asignaci\00F3n de id (USUARIO_ROL_PK)')
,p_version_scn=>39386970330605
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(232493798054995679)
,p_name=>'USUARIO_ROL_USUARIOS_FK'
,p_message_language=>'es-py'
,p_message_text=>'Existe dependencia con este registro, no puede ser eliminado.'
,p_version_scn=>39279851708662
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(198524684634388485)
,p_name=>'WWV_FLOW_DATA_SESSION_FK'
,p_message_language=>'es-py'
,p_message_text=>'DEVELOPER TODO: Provide better message in APEX Shared Components Text Messages for WWV_FLOW_DATA_SESSION_FK'
,p_version_scn=>39388054649805
);
wwv_flow_imp.component_end;
end;
/
