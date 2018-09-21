#
# FiniteTopologies: (Co)frames/Locales of Zariski closed/open subsets
#
# Implementations
#

##
InstallGlobalFunction( ADD_COMMON_METHODS_FOR_FRAMES_AND_COFRAMES_DEFINED_USING_FinSets,
  function( finite_topological_frame_or_coframe )

    ##
    AddIsWellDefinedForObjects( finite_topological_frame_or_coframe,
      function( A )
        local emb, im;

        A := MonomorphismInUnderlyingCategory(A);
        im := ImageObject( A );
        emb := EmbeddingOfFinSets( im, finite_topological_frame_or_coframe!.AmbientSpace);

        if not IsWellDefined( emb ) then
          return false;
        fi;

        return IsWellDefined(A);

    end );

    ##
    AddIsHomSetInhabited( finite_topological_frame_or_coframe,
      function( S, T )

        S := MonomorphismInUnderlyingCategory(S);
        T := MonomorphismInUnderlyingCategory(T);

        return IsWellDefined( EmbeddingOfFinSets( ImageObject(S), ImageObject(T) ) );

    end );

    ##
    AddTerminalObject( finite_topological_frame_or_coframe,
      function( arg )

        return TerminalObject( finite_topological_frame_or_coframe!.AmbientSpace );

    end );

    ##
    AddInitialObject( finite_topological_frame_or_coframe,
      function( arg )

        return InitialObject( finite_topological_frame_or_coframe!.AmbientSpace );

    end );

    ##
    AddCoproduct( finite_topological_frame_or_coframe,
      function( L )

        if Length( L ) = 1 then
            return L[1];
        fi;

        L := List( L, MonomorphismInUnderlyingCategory())

        # TODO: Return corrrect type.
        return UnionOfFinSets(L);

    end );

    ##
    AddDirectProduct( finite_topological_frame_or_coframe,
      function( L )
        local iota1, iota2. D, product, pi1;

        if Length( L ) = 1 then
            return L[1];
        fi;

        L := List( L, MonomorphismInUnderlyingCategory())

        # iota1 := EmbeddingOfFinSets( N1, M );
        # iota2 := EmbeddingOfFinSets( N2, M );
        # D := [ iota1, iota2 ];
        #
        # product := FiberProduct( D );
        # pi1 := ProjectionInFactorOfFiberProduct( D, 1 );
        # return ImageObject( pi1 );

    end );

end );
