find_package (Perl 5.10.0 REQUIRED)

function (parse_template_file OUTPUT_NAME INPUT_NAME ARGS outputlist)
  set (OUTPUT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/${OUTPUT_NAME})
  set (INPUT_FILE ${CMAKE_CURRENT_SOURCE_DIR}/${INPUT_NAME})
  set(${outputlist} ${${outputlist}} ${OUTPUT_FILE} PARENT_SCOPE)

  if (WIN32)
    add_custom_command(
      OUTPUT ${OUTPUT_FILE}
      COMMAND if exist {${OUTPUT_FILE}} {icacls ${OUTPUT_FILE} /grant everyone:F /Q}
      COMMAND ${PERL_EXECUTABLE} ../shell/parsetmpl.pl ${INPUT_FILE} ${OUTPUT_FILE} ${ARGS}
      DEPENDS ${INPUT_FILE}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating ${OUTPUT_FILE}")
  else (WIN32)
    add_custom_command(
      OUTPUT ${OUTPUT_FILE}
      COMMAND [ ! -f ${OUTPUT_FILE} ] || chmod u+w ${OUTPUT_FILE}
      COMMAND ${PERL_EXECUTABLE} ../shell/parsetmpl.pl ${INPUT_FILE} ${OUTPUT_FILE} ${ARGS}
      COMMAND chmod a-w ${OUTPUT_FILE}
      DEPENDS ${INPUT_FILE}
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating ${OUTPUT_FILE}")
  endif (WIN32)

  set_source_files_properties(${OUTPUT_FILE} PROPERTIES GENERATED TRUE)
endfunction (parse_template_file)

macro (parse_all_template)
  set (TEMPLATE_ARGS double DARRAY fftw)
  parse_template_file (tz_darray.h tz_array.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_darray.c tz_array.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS float FARRAY fftwf)
  parse_template_file (tz_farray.h tz_array.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_farray.c tz_array.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS int IARRAY)
  parse_template_file (tz_iarray.h tz_array.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_iarray.c tz_array.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS int64_t I64ARRAY)
  parse_template_file (tz_i64array.h tz_array.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_i64array.c tz_array.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS tz_uint8 U8ARRAY)
  parse_template_file (tz_u8array.h tz_array.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_u8array.c tz_array.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS tz_uint16 U16ARRAY)
  parse_template_file (tz_u16array.h tz_array.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_u16array.c tz_array.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS double DMatrix darray)
  parse_template_file (tz_dmatrix.h tz_matrix.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_dmatrix.c tz_matrix.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS float FMatrix farray)
  parse_template_file (tz_fmatrix.h tz_matrix.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_fmatrix.c tz_matrix.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS int IMatrix iarray)
  parse_template_file (tz_imatrix.h tz_matrix.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_imatrix.c tz_matrix.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS tz_uint8 U8Matrix u8array)
  parse_template_file (tz_u8matrix.h tz_matrix.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_u8matrix.c tz_matrix.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS DIMAGE DMatrix DOUBLE D fftw Double darray)
  parse_template_file (tz_dimage_lib.h tz_timage_lib.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_dimage_lib.c tz_timage_lib.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS FIMAGE FMatrix FLOAT F fftwf Float farray)
  parse_template_file (tz_fimage_lib.h tz_timage_lib.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_fimage_lib.c tz_timage_lib.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS IIMAGE IMatrix INT I fftwf Int iarray)
  parse_template_file (tz_iimage_lib.h tz_timage_lib.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_iimage_lib.c tz_timage_lib.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS FFTW double)
  parse_template_file (tz_fftw.h tz_fftw.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_fftw.c tz_fftw.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS FFTWF float)
  parse_template_file (tz_fftwf.h tz_fftw.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_fftwf.c tz_fftw.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Int int basic)
  parse_template_file (tz_int_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_int_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Int64 int64_t basic)
  parse_template_file (tz_int64_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_int64_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Unipointer unipointer_t compact_pointer)
  parse_template_file (tz_unipointer_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_unipointer_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Stack_Tile Stack_Tile object)
  parse_template_file (tz_stack_tile_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_stack_tile_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Stack_Tile_I Stack_Tile_I object)
  parse_template_file (tz_stack_tile_i_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_stack_tile_i_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Neuron_Component Neuron_Component object)
  parse_template_file (tz_neuron_component_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_neuron_component_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Swc Swc_Node struct)
  parse_template_file (tz_swc_arraylist.h tz_arraylist.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_swc_arraylist.c tz_arraylist.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Int int basic)
  parse_template_file (tz_int_linked_list.h tz_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_int_linked_list.c tz_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Double double basic)
  parse_template_file (tz_double_linked_list.h tz_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_double_linked_list.c tz_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Object_3d Object_3d_P object)
  parse_template_file (tz_object_3d_linked_list.h tz_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_object_3d_linked_list.c tz_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Voxel Voxel_P compact_pointer)
  parse_template_file (tz_voxel_linked_list.h tz_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file (tz_voxel_linked_list.c tz_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Unipointer unipointer_t compact_pointer)
  parse_template_file(tz_unipointer_linked_list.h tz_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_unipointer_linked_list.c tz_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Int int basic)
  parse_template_file(tz_int_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_int_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Local_Neuroseg_Plane Local_Neuroseg_Plane_P compact_pointer)
  parse_template_file(tz_local_neuroseg_plane_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_local_neuroseg_plane_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Local_Neuroseg_Ellipse Local_Neuroseg_Ellipse_P compact_pointer)
  parse_template_file(tz_local_neuroseg_ellipse_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_local_neuroseg_ellipse_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Local_Neuroseg Local_Neuroseg_P compact_pointer)
  parse_template_file(tz_local_neuroseg_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_local_neuroseg_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locseg Local_Neuroseg)
  parse_template_file(tz_locseg_node.h tz_trace_node.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locseg_node.c tz_trace_node.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locrect Local_R2_Rect)
  parse_template_file(tz_locrect_node.h tz_trace_node.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locrect_node.c tz_trace_node.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locnp Local_Neuroseg_Plane)
  parse_template_file(tz_locnp_node.h tz_trace_node.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locnp_node.c tz_trace_node.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locseg_Node Locseg_Node_P object)
  parse_template_file(tz_locseg_node_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locseg_node_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locrect_Node Locrect_Node_P object)
  parse_template_file(tz_locrect_node_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locrect_node_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locnp_Node Locnp_Node_P object)
  parse_template_file(tz_locnp_node_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locnp_node_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locseg Local_Neuroseg)
  parse_template_file(tz_locseg_chain_com.h tz_trace_chain_com.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locseg_chain_com.c tz_trace_chain_com.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locrect Local_R2_Rect)
  parse_template_file(tz_locrect_chain_com.h tz_trace_chain_com.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locrect_chain_com.c tz_trace_chain_com.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locnp Local_Neuroseg_Plane)
  parse_template_file(tz_locnp_chain_com.h tz_trace_chain_com.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locnp_chain_com.c tz_trace_chain_com.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locne Local_Neuroseg_Ellipse)
  parse_template_file(tz_locne_node.h tz_trace_node.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locne_node.c tz_trace_node.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locne_Node Locne_Node_P object)
  parse_template_file(tz_locne_node_doubly_linked_list.h tz_doubly_linked_list.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locne_node_doubly_linked_list.c tz_doubly_linked_list.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  set (TEMPLATE_ARGS Locne Local_Neuroseg_Ellipse)
  parse_template_file(tz_locne_chain_com.h tz_trace_chain_com.h.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
  parse_template_file(tz_locne_chain_com.c tz_trace_chain_com.c.t "${TEMPLATE_ARGS}" GENERATED_NEULIB_SRCS)
endmacro (parse_all_template)
