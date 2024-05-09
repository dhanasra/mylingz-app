import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylingz_app/base/base_viewmodel.dart';
import 'package:mylingz_app/network/models/biolink_design.dart';
import 'package:mylingz_app/pages/biolink/bloc/bio_link_bloc.dart';
import 'package:mylingz_app/utils/global.dart';

class BioLinkDesignViewModel extends BaseViewModel {
  late ValueNotifier<BioLinkDesign> design;
  
  BioLinkDesignViewModel(){
    design = ValueNotifier(Global.bioLink.value!.design ?? BioLinkDesign());
  }

  saveDesign(BuildContext context){
    context.read<BioLinkBloc>().add(SaveDesignEvent(design: design.value));
  }
  
  @override
  dispose() {
  }

}