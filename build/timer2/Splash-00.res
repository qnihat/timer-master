tcl86t.dll      tk86t.dll       tk              __splash              �  '�  �   �   Xtk86t.dll tk\tk.tcl tk\ttk\ttk.tcl tk\ttk\utils.tcl tk\license.terms tcl86t.dll tk\text.tcl tk\ttk\fonts.tcl tk\ttk\cursors.tcl proc _ipc_server {channel clientaddr clientport} {
set client_name [format <%s:%d> $clientaddr $clientport]
chan configure $channel \
-buffering none \
-encoding utf-8 \
-eofchar \x04 \
-translation cr
chan event $channel readable [list _ipc_caller $channel $client_name]
}
proc _ipc_caller {channel client_name} {
chan gets $channel cmd
if {[chan eof $channel]} {
chan close $channel
exit
} elseif {![chan blocked $channel]} {
if {[string match "update_text*" $cmd]} {
global status_text
set first [expr {[string first "(" $cmd] + 1}]
set last [expr {[string last ")" $cmd] - 1}]
set status_text [string range $cmd $first $last]
}
}
}
set server_socket [socket -server _ipc_server -myaddr localhost 0]
set server_port [fconfigure $server_socket -sockname]
set env(_PYIBoot_SPLASH) [lindex $server_port 2]
image create photo splash_image
splash_image put $_image_data
unset _image_data
proc canvas_text_update {canvas tag _var - -} {
upvar $_var var
$canvas itemconfigure $tag -text $var
}
package require Tk
set image_width [image width splash_image]
set image_height [image height splash_image]
set display_width [winfo screenwidth .]
set display_height [winfo screenheight .]
set x_position [expr {int(0.5*($display_width - $image_width))}]
set y_position [expr {int(0.5*($display_height - $image_height))}]
frame .root
canvas .root.canvas \
-width $image_width \
-height $image_height \
-borderwidth 0 \
-highlightthickness 0
.root.canvas create image \
[expr {$image_width / 2}] \
[expr {$image_height / 2}] \
-image splash_image
wm attributes . -transparentcolor magenta
.root.canvas configure -background magenta
pack .root
grid .root.canvas -column 0 -row 0 -columnspan 1 -rowspan 2
wm overrideredirect . 1
wm geometry . +${x_position}+${y_position}
wm attributes . -topmost 1
raise .�PNG

   IHDR   l   l   �fW�   gAMA  ���a    cHRM  z&  ��  �   ��  u0  �`  :�  p��Q<   bKGD � � �����   tIME�	���  &�IDATx��k�^Uy�Ϝs��}ɾeG	FRPn�-^��&�U���j=�=_�v�G��c��/=�3:Z�(�BB�(�*(ʥUD<B$�;;����Zs>��\�Bvvv.X�c�yߵ�Ϛs>��#�f���Nh5�r�����F��\�l�`��@p�or�4�Y`x����40���,t�H�Ǝˮ=�S�r� ����Q'�ץ��3���ˀ��M�z��E��90�O�� �)�H�_T+H�l��z�N���<�	t�(��f����%�+��$+�?��vW��X՘S��N�����.0v��3�k�-��ĭ�t�� �؉����@�l�{N�N����4�xK#q���(�̀9�O�r�J�ܦ���@1�;.�I�I�և�.��ˀ�> l8)O�v8 �	|���}��W��3�
l���ƨ��,\|�0r��� ��;��M^A�O�j;a����K�\|
�p�	{�S�=��_ j���[mk.��}{�Ex�9���~ �5�]�;ۯxך�dMvت� �)qe����:�0C\iC<뀵]mk&�aE[�jீ�Z� T�}rB��J/,��_ ���@�q�Jh�=;[�{�U�w��$���>�1*�PRN7�ѨY��=|��h��r�ޒ��o�`'���}ĳ��~+@ A|������@'��%�#�]�����k�/��_�z/ɪ���{]X���>�1��`U���Us./�	ʄ9��ҟ�f�ψ�T��T�W%�-����kq�F�
n��\L�Kz��a�ͣR�r��`z� �L�ߗb�:�Ê**�NY6/|8�J���9��f��`A�<���`���
����7G���J�NL�U=	�1b�V��>����ĉ[	B[�����	G����B ��h�}��D�`QTV��vO���c�a
�YD����5�%>8R��(�K�(��qe-�xU�2�5�*��i.
Z0G��$���}���21Ͼ���Q��h���^�X�c�)-
k����
%o]W����D�D0��O������
�N�A9�����9�)5��dx��ˮ����V	�pF�R֜\� d(O�Sfs����8$�pnI(��pq/�Tٶ��s�`Xj��(�-��3�ر�q+�������'V���V��9���}�%�&%��h`wn:4ǳ� ��hw���ql�a�2I0�g�?��y��^*q�Ul��Y�t����	���n�ʛ{�)&�G9��s(3ņ+�6(�x�`��{�X��V���j�4x���1�k�"����Sh�+���J��DX	�߁�z,��Iɳu��{�T	�!!������{��E��@��������3��YO�z�-c��{�Ӱ�J���.	�W6T��J�H��+��2&�!aJ,{�[HbxM���S-%T�6RyKf9�*tv738��(�b�0j�����|�lGFV:1�/${?���'���|�[������J���،�����
��B�s<��|p��:Q8HTD�*���+�с>z]Nf�������Yo)*�$(��mO���\We�H��z���%����{[9�Lpm�<�J�b8�\B,�r���Y.�;m2�GmΨ���jy:m3�«�5*6'�/��%u����wY�7�P~��y���_|�+�'��>����_�`�B�K \�G���[�%�$>!��P��Wǚ�j-�XCϻz�2X�T*ΐ <с:8ͮ�Q>��ݠ�@��d�Cb,���pV^�$��Rbo��L�8mO�;��T*�%7�PI�X.q��1�Rlqj<���Zo���1���k�U&�}Y�Q��"y���{A���^T`K��D���+yuKe})���\ћ �� ����3�M48��j���@�fl��݃50������s��O��%t�
9��^O�:t$��R����2ℍ�
Ϥ9�yF��T+�A��j���Ɍ2���5��6��_#^��i�D�ym�J�	�B�UΩ���s�I� ��Ӭx-�-`�h[����{g_�<�ѕ�Ù������F=)&5'�;�:l;4�\VƊ/vڨ��Z���zx�PB	�(���I�z����é�9�.+�+qEjp<�i�
�Y�
5	dJ��T�@�2^hw�ޖg>(k��	ؐP/yΩ$L���l���q��/���ë�5֙@n��QέV�rṬ�_��x�¸A7�Fv��o�G~�0c<�S+@���zzy]=��~2~�L�����mP�0�ʹ�2o����'7����'ٗ)�5)���:��"xr�<�ީ&ߝ�'�x^U��m`%� EMJ�?����&&/�MN.�W9����Y�z�\0x�1x��q��i�j��.p�p��RB�r��S�\N�#,��0n�1R�9�1�%*�??��+Q5W��Y6��߄��C "����&ht[yQ�%��}&���#�Q�Q!e�+sN�D��Sx67���,>x���0lKl���x�
I��s��<M��?D�x/J�X.�P�%�@'w�35�X��Vh�s�9`����v����s�+�UD�Ͼ�r�D��ZR�a���Ȇ2�V�e�`��mS�<2��x*���F�\ӗg�QB0�Q��	e���_��VQy�����i3^����z���h��z/+�F�e�ɏZ���%����*o�8�cN��f|aF��mE1ן��|\�=�^L`�?�H��̱
 �P�-{�p��,{r����
*�O�sv�cs&*��%n����F 1�����u��z�����#���\�t��P�T<'�!�}l��9�%�9F�A��u�¥5��{�Z�p���{�,�"�
UIy�@�k�GK&)ߞnr�d�R��cw��Z��p,S:b���HE�`U1 ��M|��Sa<����+J<�%�h��D+0S���U�Ou:�QIX�,^�IƹI�'ɘH�*�(���M\� U�|l��U����$�4���9ߛ�	F��8����`�kzT����O6��Lԡ5�n�թ�-C��R%����frv�i"`<X���uĭ�[��y�1~�7/������+�S�V���\Q�����k�f3!����*|xC�Q�C��rP	���p��y���`3��U���9�b���Bf	T��纡:W�U�m�EIU��d��gx,�$�S��sͺo�`��̸w�CF���$/�(WX�7T���1%�X�c��/��fl�
)d�<K�%+l�#;c�(f��+��X)��w`Ns^[�P'CԱ�,�s����Ȃ!���C
�d��i�kk�0%r��upF9ao3e&��X���I����Ρ�����5�曓)Mc0@*��u	������p��<�8��_�\��^�G�{0C���G�mc�	�әu$ԁ��M����d�?������e�>��`�J� �Q���e��D�F�Nj���̇jTm��b�� ?��6��?IHP��1Z��68��U��ށ2� ��M�o
�1٢���`2~�_�:X�l��3聹�;&2Z���R�F�"\T�|l���	
H���ƚ��2��8�B�Y&�%U$7����1�+@@U��t�����b���2�_׋uiw�#@��f�k�
��r	�[/����
�8�W�
x�x����l?Ԡ�-"6X��^�:�O��+u�G����&��.�ʂD��l�>>��p)ǋP��D�r�x�}yT�B�^[#l nX��(���d�"ٲVw<Ll���s��������6�(���!���,=�����i�T������9S�g*�1�o;�l�p��D\qx�Kj��z�wU���N�[��̥P����[2��U2|b��3K��"��s���O�9�4�mm��L��QW`�nt-���!���15�}s�'� $��u�U�4X/ϓ(�fSvL��%	JnW���n���i�-�S��9�j_94�Tj)����1�sj�GF{J �z��rp�C��.�p�O�h��ё:�*��rpLv��:6�Ӎ��F�W�ͅLd�n�c���Nhɏ�xf�p��y�"\�S��[�G����,�5��K���yl����+�s�B=wx���A���9��K�R��3���4��'���P�H.8c��n>8ˁfB��8���Fl΍C�\X3,޶��$�r���M%���roƱ�2�E�v lW;. �FzN���ڮZ*��d�QN-E��s���
��}���q;F���O�6�-���W�*d^y��a>�`5zK�rF	>�a��!j�&0�Zn��WM%w��A�M4�I���}\�W�\L��9n;4�)�����< ��m��Ob7�C�s����/����;��48��0���+pf�v��,�~�^��t��_2lLT 1gW�L{�Te�0���C�\��ňa:��|p�7�.��UG���2\皾I��R;&R�ɉ��IK��~<L��1�
�o?�X�y�����,{RA%�p�GF+����^��c5zCf|��<�4s2c�`�5ʇ��\Q$&��*��իb9�¶��<��0Vc��Ċd�g��[וq���Ɍ������ɏoJR�P��9�X ~��M@Dy�#�:6ˁ,'�)1ܰ��W�cV����H�s���Q5��2h\����}��\UOP�A����kt�� �T�(�T�f0�]�err�N���d�=�&ﺩN�4]B�т�q�Z��C
-KD�i;���YN��.L�g����|���l�y��/�awK��p	~��[�,jI�h���ߝM!�p!�,1
^BE����\�DP�ၙ��CZʒS�Wؼ��т�.��Q+N�ϧ�2ՠ�v�����z���:�����'��4PR��p��i�IK�\n�$JR8k;��{��=�-R,��Dgs ��+����������G��mr�NfN���")d�!V�\|��1��ی�g_�j1+B)Đ�=e���d����qCNY�]m����<�Y(���sv�uh����&F���"x.�Z�À��+���<�v��ޞ5UC���t�GQD��7��͉36�5�~���u�U$�N�JnQ,�8J݁��q����f��#1�`){Cn`SM�q��a'�&'	ʮ����Y��Xd~��QlF��i������p�L�w&[�T�`;�c]���Wq�Ҷ`r.��C5��p��X	���%uÇ�+�ǄX�ײ�ה�O��JF@���gR�W&���9���J��h�D['�X^Di+|�Pʽs(\L�*����2")A��*�0�ϺD�ϟ��P˚�yk�����$Ƽ�J���X�K��/|i�������=�9��O���O�h�� m�co�A�qvRB%Ǌpv��L���3�lL^��v�?�o2�s�1��*��Z&G��7�ֹ�V"HF��p��<?kf���c��v9"��i�X"L�%�kR�y.։����<��NQ2���r�x����g�I�T���2js�^y�@�K��u
=��q�x��iL5�#AN��p�8۱���AT��1�{�yb����u5�EF�NP5�̶���睌�i�ۧ稉�M%:�S��)�H0����e�M����� ��r
E��i�l,��Hy�BB�����Ͳ��X2b�h�O5:	_��᧍����X�y­����\��7����z� w����)^b��R���_Æ��}Z"Q_%z�K��K�el�}�S�����<>5D�PTd*H`65|}|��6c�F$#E�o"�s-r.P�� k9^K�b��i����Ǯ|e�ɡ�<l?�ၙ���eKK��6�1��p��?O!���ۧ�d��*��%��)��<�a5ng6D�Ϛ9_�h1�$�7����i���]�X��	<������e��=3m�
�_����4Y�q�ܹ'	s��")~2�$C�"F1���?�Ę����ځ�:sF����4e�9�%"�nR�"��������_c���X(����V�.Ib;}����٥_�K����2^
�(q_�KC��2^�5��/㥁	C$b|/<g��c^�K����˪����!�d�?գyG�<�+C�5~|�z'��ӆ�C����8*�����ѵ�z��-��]	o����{)��
<
��Q�G�r��l��TT�78*�T$!2<A���W-�xjP���8z�� !P&'�@)��!y���Ȉ2Z�<F�L��㽲�D������O�yh�3�t����㾩���p�E�1t���C#=�X���&O4)�b�r���	�__�,!��9�f��k~y˿_�'�ha>���	�^_�\Z��fq���,�f�ryU)E����j�ߨW���b��j̱�9.�X^Q��\UK�c�2�h��A�kuu���%G8�f�pv�FC�BnQ)ϵL��qh��̱�+"�Q��g3�����9�.5�����@�bU��!��x�$ґ�E?�H�i�g�)Zz�`D"��
F��,���{���
����Q�A䁸��1w��$TL]�͵6�*&������io�%��l�1`^��TiS�*m�>r��IJ!q�6pI�uV����XOt�C�`*<��<݉��¨��~���9\�[��Z��<N59b�z��^i3^WO8�Vb�82	�M3��ٗ�+l���+d�Tk��]ۥz�Elй6�"d�}e�(	s^�]����`���9��'T���q��9ǜ��H9uF���K|l���p�������g[����2�rF�l��t'z(I�f��%C���&�
A��z�:�ǵ�e�y`:x*�pio����|q_�CY@$,��Y,dÎˮ�J�Z��R����̠��d��ټ�y=e2�fof9�.�s@cE�Ή�N6��+z1o��s��T剹�[�ŞF��,�\�u����\��į����$CؐԹ�P���5yE����\T�|�$�t"�^�~2�1��y��� �C��#븼_��f��l8�
�t�.�}ȵ���,�y���'2�u4�m��J�X����W����Ǔj2�bi+xǺڴ��9��<�n>es��Ȁ#Qa$��Xs#�׸5*��l�q�\�io�:0���R�Tlk����VN&���]�������_34D^�տs�
�Du���wF��^��/�����'�9��=�u:*M8���ŀ)
�E���yt�ۉ��Md�~{����z��F� $.2���nc��V5��gm!D+��1�3Q"�DURޱ��;{�)��f�1o։A5n�k���a/a���b����s�{�T�i
���R�?�1K�]��h�ȓ��Y�.���爯Ĳ�������$�kG��r��&�jY���`��t��$)y0�/p�O�r�����[�6�aH}��u�5���G���'aa�Uc���uҪ�MS�IQ��)3^@/&2��-VTU��l�E��@��r�En���U^e�A�	ݎ��FfRaW3�6HR�P/�ɗ� Q��h#jH��,1�N
��@�l(9ǁ�aw3e�+�*	�z���;.���B��%+��-u�_�g���%���QL�T�`I��i�E� ,*9��sU��@I1���~�M�/�O2�WI4_���G������^��Z�;��<2�-A�x��d�l�(tF�f�X_.Q���m1r�A$�ـ��@���R�<�c���*o�z�^r�W��ǩ"��L�թ�/�`�e�=��'�_0`�# ۀ?Z��:j�~C)�S���R��P��9H@4Y0f'3�iiG"0o[LyА`x���H�gO'�@�hC�����ؘ'7�֛
�m�޶�ʆ�Rr�G���2^_��D�)l*EM�Pn�g.gw;��A�(6��]���x�߁��5�́
�����'������� $+ty?�
D�,]�s�����`���Z!G�"YI�A��Z"sL� .r
y�Z�<Dp^I�F�xQ9���'�x�@�-9.6H*x	Ԋ�0��)�Eb'%�)�#��G*$d6Gԑ�d�-�,At�U4֨�>����J��*���\<�*ۯ\��y�U��Ҡ?N� ~��
��EM׭��`ȥL(���&�u rc�r��y���~����v��'�T���Q�#��*��Zۅtp�(��g�)�������B0�h���&�Ε�
��/[f�(H~���{�K!����~���~=p��]�O���;���{�q���Jr���v�T?���z�����,��T�"��|'_(� sya���vT�����/c�'�c�o�xT���]M�i�:��sDa= G�nak| �<1i�e�Z�狹e%�Q�����k�&�o��p<v�h�1Bm��B��#����,���ऴ>����&Fc~H0�1�Ý�XU[�;��\p�3��A|tt���+�$/Yf�Q)��H�(����Nrϝ����X#ˋO5�	Ep�D��L���d]uȺn!�W��Z!Q��	��*댥�XĄ�fQ��Q��mW��R3P蕓F�������t��r����$؅#l���[ܯx`��~g����Ɍ�#�(C儷��������W��&��Ps�2���-�ϵy*͹�W��VbZ����Ӟ��f`�8v��H�7�p�U�6u������k�v�6�$�]<���r(����5x��F-��y�v����<6�L��`9�Z��Eǵyc�Ð���Typ*�3N�xg1WO�����`��6;.�Ҡ�b��/s�G�P5B�* ��E��,��9h�@"��=�-ˎ�8�zR����D[�X��%��S��j������s�Î�W��p�I=;.�/�|������N�ϼb��Q�[�%�g����
�;��=�R«��񎒪��έW�Q.�82�����:�$�]�U�9�*U�k�I����*�䏋9����`Xhe� ��%k��z�����Q:��.&�Cjr���Q�%��P��hj�H��b���$(sC�4%h�!��sDG�MtMt1�f�X�M`�N�����_qܾ�nA�6S�C���\��,����h��6j�.(�	�b<L��h��BLkF�w?��(,��'�.�t�>�Y��O��15��B��d-ʓD���K����d.x�P�`"10�%��GqE�B^$���Z%f�����p���	N�R���o/^V�E��������(w!]Jn]���Xp´��V�z�J���9ͱ��J��Ԋ��Z�j�o}����[�rE���{��.����A`�w�v���|mW�R�_L��X�j��ҿOl?�fmO��/�h��l'jU-�Isw_��=hX̕/|_D�m!6�<-�����.b%�m
�u�<QE��㰭�'=>���w-o׾؎�Z��d�
�c����N��������������ҖGv��˓��ĕv���%�fg'��YF, �1���>�ʊ$��X՘e��'�Ep�w�N�퉻sS*Z=^Dlvv11:���8�x��s"�8щ�(�Z�1b�Bi�ZAr=n/�Z��Rlyd'�jbʕ���J�*7;2�K�s��E���̢0s��h��D��n")گ��Mc��N��S����������Һ   %tEXtdate:create 2023-02-27T14:12:45+00:00&* �   %tEXtdate:modify 2023-02-27T14:12:45+00:00Ww�    IEND�B`�