package tec.bd.service;
public class DatabaseStoredProcedure {
    private boolean createMovieViaStoredProcedureEnabled = false;
    public boolean isCreateClientViaStoredProcedureEnabled() {
        return this.createMovieViaStoredProcedureEnabled;
    }
    public void setCreateClientViaStoredProcedureEnabled(boolean flag){
        this.createMovieViaStoredProcedureEnabled = flag;
    }
}
