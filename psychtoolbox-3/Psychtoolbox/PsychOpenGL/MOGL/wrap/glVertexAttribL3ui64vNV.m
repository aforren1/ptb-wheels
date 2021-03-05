function glVertexAttribL3ui64vNV( index, v )

% glVertexAttribL3ui64vNV  Interface to OpenGL function glVertexAttribL3ui64vNV
%
% usage:  glVertexAttribL3ui64vNV( index, v )
%
% C function:  void glVertexAttribL3ui64vNV(GLuint index, const GLuint64EXT* v)

% 30-Sep-2014 -- created (generated automatically from header files)

if nargin~=2,
    error('invalid number of arguments');
end

moglcore( 'glVertexAttribL3ui64vNV', index, uint64(v) );

return
