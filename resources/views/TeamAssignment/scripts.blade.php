    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamBuilder.js"></script>

    @if((Auth::user()->enumUserType) == 'Admin')
        <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignment.js"></script>
    @elseif((Auth::user()->enumUserType) == 'Affiliates')
        <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignmentAffiliates.js"></script>
    @endif
    <script src="/others/stisla_admin_v1.0.0/dist/js/algorithm/teamschedules.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/appendFunctions.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignmentMisc.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignmentTeamList.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignmentTugboatList.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignmentRequestTeam.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/teamassignmentRequestTugboat.js"></script>
    <script src="/others/stisla_admin_v1.0.0/dist/js/teamassignment/validation.js"></script>
    {{--  --}}
    <script src="/others/stisla_admin_v1.0.0/dist/modules/nice-select/jquery.nice-select.min.js"></script>
    