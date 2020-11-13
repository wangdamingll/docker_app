aux_source_directory(. FILES)

add_executable(testapp ${FILES})

message(STATUS "bin:" ${CMAKE_SOURCE_DIR}/../publish)

install (TARGETS testapp RUNTIME DESTINATION ${CMAKE_SOURCE_DIR}/../publish)
